## 1.0.2 - 2026-03-28

- Added support for ISBNdb's new `/feeds/books/updated-isbns` endpoint.
- You can now fetch the recent ISBN update feed, including each book's `isbn13`, `updated_at` timestamp, and pagination metadata.
- Refreshed the bundled API snapshot and package documentation to match the latest ISBNdb contract.

## 1.0.1 - 2026-03-17

- Aligned the client with the current ISBNdb API contract (notably `pageSize`, `shouldMatchAll`, and `column` for book search).
- Added/updated optional query support on details endpoints (`language`, and pagination for subject details) to match the live API behavior.
- Expanded contract and live smoke tests to cover these API changes and prevent silent regressions.
- Improved API drift monitoring in CI with clearer diagnostics and automatic issue creation/updates.

## 1.0.0 - 2026-03-05

- Unify API failures under ISBNdbException (41dfb37)
- Align books endpoints with official API behavior (df9437c)
- Support `oneOf` response parsing across models (1f579d7)
- Expand error handling coverage and API message extraction (165b172)
- Add `/key` and `/stats` endpoints (2fe17df)

## 0.5.1 - 2026-03-04

- Add local release helper script (1eaad1e)
- Upgrade Dart/Flutter dependencies in lockfile (6354396)
- Run live API workflow on pushes to main (ef11a54)
- Harden API client tests and add CI/live workflows (f34f44e)
- Fix JSON decoding and list parsing for ISBN batch endpoint (7dfdc34)

## 0.5.0

- Added a converter for `dewey_decimal` since ISBNdb can return either string or array of dynamic

## 0.4.0

- Updated freezed to 3.0.0: if you are also using freezed in your project, it may be a breaking change
  Please check https://github.com/rrousselGit/freezed/blob/master/packages/freezed/migration_guide.md
- Removed depedency to universal_io

## 0.3.2

- Updated packages to last versions

## 0.3.1

- Updated packages to last versions

## 0.3.0

- Back to extensions for var `isEmpty` to avoid freezed errors when generating main class

## 0.2.8

- Moved `isEmpty` to main class instead of extension to avoid documentation boilerplate
- Made DateConveter and MsrpConveter private and protected

## 0.2.7

- Added flutter_lints and fixed warnings

## 0.2.6

- Reorganization of code with only one freezed file

## 0.2.5

- Updated packages to last versions

## 0.2.4

- Added nullable String for the list of authors (sometimes ISBNdb returns a null value inside the array)
- Added uppercase to the date because sometimes ISBNdb returns a date with lowercase "t" and "z" which fail the parsing

## 0.2.3

- Fixed small issues

## 0.2.2

- Completed documentation

## 0.2.1

- Added documentation for most of API

## 0.2.0

- Now supports Flutter web by replacing dart:io with universal_io package

## 0.1.0+6

- Changed reponse body from Dio to bytes to handle better special chars decoding 

## 0.1.0+5

- msrp can be either a double or a String in the API... needed to handle both cases in MsrpConverter

## 0.1.0+4

- Updated book.g.dart class to conform to new MsrpConverter

## 0.1.0+3

- Fixed an issue in MsrpConverter

## 0.1.0+2

- Preview screenshot updated

## 0.1.0+1

- Fixed small isue in example

## 0.1.0

- Initial release
