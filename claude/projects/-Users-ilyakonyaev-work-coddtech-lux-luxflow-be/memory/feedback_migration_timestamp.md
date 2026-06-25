---
name: Migration timestamp generation
description: Use node -e "console.log(Date.now())" to generate TypeORM migration file timestamps
type: feedback
---

Always generate migration timestamps with `node -e "console.log(Date.now())"` and use the result in both the filename and the class name.

**Why:** Hardcoded fake timestamps (e.g. `1775700000000`) can collide or look inconsistent with real migration history.

**How to apply:** Before creating any migration file, run the command and use the output as the timestamp.
