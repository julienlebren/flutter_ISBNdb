'use strict';

const assert = require('node:assert/strict');
const {spawnSync} = require('node:child_process');
const path = require('node:path');
const {
  sanitizeGitHubIssueReport,
} = require('../scripts/sanitize_github_issue_report.cjs');

const untrustedReport = [
  '## Drift for @org/team',
  '![tracking pixel](https://example.invalid/pixel)',
  '<img src="https://example.invalid/second-pixel">\rFourth line',
].join('\n');
const sanitized = sanitizeGitHubIssueReport(untrustedReport);

assert.equal(sanitized.includes('@org/team'), false);
assert.equal(sanitized.includes('@\u200borg/team'), true);
assert.equal(
  sanitized.split('\n').every((line) => line.startsWith('    ')),
  true,
);
assert.equal(sanitized.includes('    ![tracking pixel]'), true);
assert.equal(sanitized.includes('    <img src='), true);
assert.equal(sanitizeGitHubIssueReport('abcdef', 5), '    a');
assert.throws(() => sanitizeGitHubIssueReport(null), TypeError);

const cli = spawnSync(
  process.execPath,
  [path.join(__dirname, '../scripts/sanitize_github_issue_report.cjs')],
  {input: untrustedReport, encoding: 'utf8'},
);
assert.equal(cli.status, 0, cli.stderr);
assert.equal(cli.stdout, `${sanitized}\n`);

console.log('GitHub issue report sanitation tests passed.');
