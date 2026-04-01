---
name: ventto-repo-bootstrap
description: Use for almost any task inside one of ventto's Git repositories or worktrees, especially coding, review, debugging, docs, refactors, CI changes, or repo exploration. Trigger whenever repository-wide operating rules must apply: write responses in English, avoid em dashes, never commit CLAUDE.md or .ia files, and re-read README.md, docs/*, and .ia/ before each response because local instructions may have changed.
---

# Ventto Repo Bootstrap

Apply these rules when the task is inside a Git repository.

## Core Rules

- Write all content in English.
- Never use the em dash character, use `:` or `,` instead.
- Never commit `CLAUDE.md`.
- Never commit anything under `.ia/`.

## Repository Bootstrap

Before every response:

- Re-read the repository `README.md`.
- Re-read `docs/*`.
- Re-read `.ia/`.

These files may change during the session, so do not rely on stale context.
