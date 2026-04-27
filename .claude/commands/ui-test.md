Run the full UI test suite for KhataPro across iOS and Android.

Execute these checks in order and report each result:
1. `dart analyze` — must be clean
2. `flutter test` — all tests must pass
3. `flutter build apk --debug` — Android build must succeed
4. `flutter build ios --no-codesign` — iOS build must succeed
5. Check all 8 ARB files have identical keys
6. Flag any locale strings with overflow risk

Report ✅ / ❌ / ⚠️ for each step. End with ALL CLEAR or ISSUES FOUND.
