#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

# Purge stale local snapshots that can keep an old build_runner entrypoint.
rm -f .dart_tool/pub/bin/build_runner/build_runner.dart-*.snapshot
rm -f .dart_tool/pub/incremental/build_runner/build_runner.dart.incremental.dill
rm -f .dart_tool/build/entrypoint/build.dart
rm -f .dart_tool/build/entrypoint/build.dart.dill.cached

flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
