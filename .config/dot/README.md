dot
===

## Installation

* Prepare the bare repository directory:

```bash
$ cd "$HOME"
$ mkdir -p "${HOME}/.config/dot"
```

* Pull the repository:

```bash
$ git init --bare "${HOME}/.config/dot"
$ alias dot='/usr/bin/git --git-dir="${HOME}/.config/dot" --work-tree="${HOME}"'
$ dot remote add origin https://github.com/Ventto/dot.git
$ dot pull --rebase origin master
```

* Include aliases to git local configuration:

```bash
$ echo "[include]\n\tpath = aliases ;\n" >> "${HOME}/.config/dot/config"
$ echo "[status]\n\tshowUntrackedFiles = no\n" >> "${HOME}/.config/dot/config"
```
