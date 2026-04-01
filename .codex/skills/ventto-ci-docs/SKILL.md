---
name: ventto-ci-docs
description: Use when changing CI, delivery pipelines, GitLab CI configuration, architecture-related files, or repository documentation in ventto repositories. Trigger for edits to .gitlab-ci.yml, CI jobs, pipeline behavior, deployment config, docs/architecture.md, or high-level technical documentation where architecture docs must stay concise, stable, and under 200 lines, and where GitLab CI linting must run with glab ci lint --repo using the absolute CI file path.
---

# Ventto CI And Docs

Apply these rules when changing CI or architecture-related documentation.

## Documentation

When architecture or CI changes:

- Update `docs/architecture.md` if the architecture changed.
- Keep documentation concise and high-level.
- Keep documentation files under 200 lines.
- Prefer stable structures only.

## CI

After editing `.gitlab-ci.yml`, run:

```sh
glab ci lint --repo <gitlab-group>/<project> <abs-path-to-.gitlab-ci.yml>
```

Notes:

- Do not use plain `glab ci lint`.
- Always pass `--repo`.
- Always pass the absolute path to the CI file.
