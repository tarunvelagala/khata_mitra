Run the QA checklist against the most recent changes in KhataPro.

Look at `git diff HEAD~1 HEAD` and the current state of changed files.

Apply the QA agent checklist — check layout overflow, dark mode, all 8 locales, iOS vs Android differences, navigation, and state management. Flag any ❌ failures as blockers that must be fixed before the next push.
