---
name: ventto-git-workflow
description: Use for any Git operation in ventto repositories or worktrees, including status checks, diffs, logs, branch work, commits, rebases, cherry-picks, merge conflict resolution, pushes, and reflog-sensitive history edits. Trigger whenever Git commands are involved and must use git -C with an absolute repository path, when commit messages must follow Conventional Commits, when squash decisions are needed before commit, or when rollback-safe reporting is required after a history change.
---

# Ventto Git Workflow

Apply these rules for Git operations.

## Git Command Style

- Always run Git with `git -C /abs/path/to/repo <cmd>`.
- Never rely on the current working directory for Git commands.

## Commits

- Before creating a commit, ask whether the changes should be squashed into the previous commit.
- Use Conventional Commits with a short message.
- Add a commit description only when the change is non-obvious.
- Use the current Git config user as author.
- Do not add co-authors.

## History Changes

After any history change, write a report and include the pre-change reflog hash for rollback.

History changes include:

- commit
- rebase
- merge conflict resolution
