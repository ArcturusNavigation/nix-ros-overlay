import * as exec from '@actions/exec'
import assert from 'assert'
import * as childProcess from 'child_process'
import fetch from 'node-fetch'
import * as path from 'path'
import * as util from 'util'

// Don't use @actions/exec because we don't want these commands to be printed
// to the log
const execFile = util.promisify(childProcess.execFile)

export async function listAttrs(
  file: string,
  parentAttr: string
): Promise<string[]> {
  const { stdout } = await execFile('nix-instantiate', [
    '--eval', '--json', '-E',
    `with (import (./. + "/${file}") {}); builtins.attrNames (${parentAttr})`
  ])
  return JSON.parse(stdout).map((a: string) => `${parentAttr}.${a}`)
}

function parseLines(lines: string): string[] {
  return lines.split('\n')
    .map(r => r.trim())
    .filter(r => r !== '')
}

export async function getRequisites(drvPath: string): Promise<string[]> {
  const { stdout: requisites } = await execFile(
    'nix-store', ['--query', '--requisites', drvPath]
  )
  return parseLines(requisites)
}

export async function getOutputs(drvPath: string): Promise<string[]> {
  const { stdout: outputs } = await execFile(
    'nix-store', ['--query', '--outputs', drvPath]
  )
  return parseLines(outputs)
}

const nixPathHashRegExp = RegExp(/^\/nix\/store\/([^/-]{32})-/)

export async function isValidBinaryCachePath(
  drvPath: string,
  cacheUrl: string
): Promise<boolean> {
  const outputs = await getOutputs(drvPath)

  const validOutput = async (output: string) => {
    const match = output.match(nixPathHashRegExp)
    if (!match) {
      throw Error(`Invalid Nix path: ${output}`)
    }
    const hash = match[1]
    const response = await fetch(
      new URL(`/${hash}.narinfo`, cacheUrl).toString(),
      { method: 'HEAD' }
    )
    return response.ok
  }

  return (await Promise.all(outputs.map(validOutput)))
    .every(valid => valid)
}

export async function printLog(drvPath: string) {
  await exec.exec('nix-store', ['--read-log', drvPath])
}

export async function instantiate(
  file: string,
  attribute: string,
  drvDir: string,
  system?: string
): Promise<string[]> {
  const args = [
    file, '-A', attribute,
    '--add-root', path.join(drvDir, attribute), '--indirect'
  ]
  if (system !== undefined) {
    args.push('--option', 'system', system)
  }
  try {
    const { stdout: drvPaths } = await execFile('nix-instantiate', args)
    return parseLines(drvPaths)
  } catch (e: unknown) {
    assert(e instanceof Object && "stderr" in e)
    throw e.stderr
  }
}

export async function realize(
  drvPath: string,
  attribute: string,
  resultDir: string
): Promise<string[]> {
  try {
    const { stdout: resultPaths } = await execFile('nix-store', [
      '--realise', drvPath, '--no-build-output',
      '--add-root', path.join(resultDir, attribute), '--indirect'
    ])
    return parseLines(resultPaths)
  } catch (e: unknown) {
    assert(e instanceof Object && "stderr" in e)
    throw e.stderr
  }
}