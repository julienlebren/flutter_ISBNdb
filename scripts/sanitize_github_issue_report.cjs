'use strict';

function sanitizeGitHubIssueReport(report, maxLength = 30000) {
  if (typeof report !== 'string') {
    throw new TypeError('The issue report must be a string.');
  }
  if (!Number.isSafeInteger(maxLength) || maxLength < 0) {
    throw new TypeError('The maximum report length must be a non-negative integer.');
  }

  return report
    .replace(/\r\n?/g, '\n')
    .replaceAll('@', '@\u200b')
    .split('\n')
    .map((line) => `    ${line}`)
    .join('\n')
    .slice(0, maxLength);
}

module.exports = {sanitizeGitHubIssueReport};

if (require.main === module) {
  const fs = require('node:fs');
  const report = fs.readFileSync(0, 'utf8');
  process.stdout.write(`${sanitizeGitHubIssueReport(report)}\n`);
}
