# Rules

## Files never to commit
- `CLAUDE.md`
- `.ia/*`

## Before anything
### If We Are In A Git Repository
- Before every response: re-read this file and apply all rules, as it may have changed since the last response
- Before every response: re-read `README.md`, `docs/*` and `.ia/` and apply their content, as they may have changed since the last response
- All content must be written in English and never use "—" (em dash): prefer ":" or ","

## Git
- Always run `git -C /abs/path/to/repo <cmd>` — never rely on cwd
- **Before commit:** ask if changes should be squashed into the previous commit
- **Commit style:** Conventional Commits, short message; add a description only when the change is non-obvious (e.g. fixes)
- **Author:** use current Git config user; no co-authors
- **After any history change** (commit, rebase, merge conflict resolution): write a report + include the pre-change reflog hash for rollback

## Documentation (when modifying architecture or CI)
- Update `docs/architecture.md` if architecture changed
- Keep files concise, high-level, max 200 lines, stable structures only

## CI
- After editing `.gitlab-ci.yml`: run a YAML sanity check with:
  `glab ci lint --repo <gitlab-group>/<project> <abs-path-to-.gitlab-ci.yml>`
  Note: plain `glab ci lint` does not work due to cwd resets; always pass `--repo` and the absolute path.

## GitLab
- MR descriptions, titles, and comments must always be written in English
- Before any GitLab action (create MR, post comment, update MR): show a full summary of what will be done and wait for explicit confirmation

## Slack
- When searching for a channel by name, always include `channel_types: public_channel,private_channel` to cover private channels and groups.
- Always use `https://app.slack.com/client/` instead of `https://spoonai.slack.com/archives/` for Slack links.

## Jira
- Before any Jira modification:
  - state what you are about to do and wait for confirmation
  - in case of addition and/or modification of a ticket/epic show me a summary of all the changes you are about to make (ex: title, fields, description)
