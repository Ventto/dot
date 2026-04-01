function gst() {
  _require git || return 1

    _git_file_blame_stats() {
        local filepath="$1"
        local input
        input=$(git blame --line-porcelain "$filepath" | grep "author .*" |\
                      awk '{$1=""; print tolower($0)}')
        # Count occurrences of each unique line
        local counts
        counts=$(printf '%s\n' "$input" | sort | uniq -c)
        # Total number of lines
        local total
        total=$(printf '%s\n' "$input" | wc -l)
        # Calculate and display percentage for each unique line
        printf '%s\n' "$counts" | while read -r count line; do
            percentage=$(echo "scale=1; ($count * 100.0) / $total" | bc)
            LC_NUMERIC="en_US.UTF-8" printf '%.0f %s\n' "$percentage" "$line"
        done
    }
    _git_file_commit_stats() {
        local filepath="$1"
        # Get list of authors and their commit counts for the file
        git log --format='%aN' -- "$filepath" | tr '[:upper:]' '[:lower:]' |\
            sort | uniq -c | sort -rn | sed -e 's/^[ \t]*//'
    }
    local filepath="$1"
    # Check if the file exists in the git repository
    if ! git ls-files --error-unmatch "$filepath" >/dev/null 2>&1; then
        echo "File '$(basename "$filepath")' not found in the git repository."
        return 1
    fi
    echo "[ Blame Stats ]"
    echo
    _git_file_blame_stats "$filepath"
    echo
    echo "[ Commit Stats ]"
    echo
    _git_file_commit_stats "$filepath"
}

# Avoid conflict with oh-my-zsh
unalias gcl
function gcl() {
  _require git || return 1

  local url dir
  url="$1"
  dir="${2:-$(basename "$url" .git)}"

  git clone "$url" "$dir" || return 1
  cd "$dir" || return 1
  git iam
}

function gwtadd() {
  _require git fzf || return 1

  local branch base common_dir repo_name repo_root worktrees_root branch_dir target choice

  branch="$1"
  base="${2:-origin/main}"

  [ -n "$branch" ] || {
    echo "usage: gwt <branch> [base]"
    return 1
  }

  common_dir="$(git rev-parse --path-format=absolute --git-common-dir 2>/dev/null)" || {
    echo "not inside a git repository"
    return 1
  }

  if [ "$(basename "$common_dir")" = ".git" ]; then
    repo_root="$(dirname "$common_dir")"
    repo_name="$(basename "$repo_root")"
  else
    repo_root="$(dirname "$common_dir")"
    repo_name="$(basename "$common_dir" .git)"
  fi

  worktrees_root="${repo_root}.worktrees"
  branch_dir="${repo_name}_$(printf '%s' "$branch" | sed 's#/#_#g')"
  target="${worktrees_root}/${branch_dir}"

  mkdir -p "$worktrees_root" || return 1
  git worktree add "$target" -b "$branch" "$base" || return 1

  choice="$(
    printf '%s\n' "Go to new worktree" "Stay here" \
      | fzf --prompt='After worktree creation > ' --height=10 --reverse
  )" || return 0

  [ "$choice" = "Go to new worktree" ] && cd "$target"
}

# Avoid conflict with oh-my-zsh
unalias gwtrm
function gwtrm() {
  _require git fzf || return 1

  local wt wt_real branch choice current common_dir fallback_dir

  wt="$(git worktree list --porcelain \
    | awk '/^worktree / {print $2}' \
    | fzf --prompt='Remove worktree > ' --height=40% --reverse)" || return 0

  [ -n "$wt" ] || return 0

  wt_real="$(cd "$wt" && pwd -P)" || return 1
  branch="$(git -C "$wt_real" rev-parse --abbrev-ref HEAD 2>/dev/null)" || return 1
  current="$(pwd -P)"

  choice="$(printf '%s\n' \
    "Remove worktree + delete branch" \
    "Remove worktree only" \
    "Cancel" \
    | fzf --prompt='Confirm > ' --height=10 --reverse)" || return 0

  [ "$choice" = "Cancel" ] && return 0

  if [[ "$current" == "$wt_real" || "$current" == "$wt_real/"* ]]; then
    common_dir="$(git -C "$wt_real" rev-parse --path-format=absolute --git-common-dir 2>/dev/null)" || return 1

    if [ "$(basename "$common_dir")" = ".git" ]; then
      fallback_dir="$(dirname "$common_dir")"
    else
      fallback_dir="$HOME"
    fi

    cd "$fallback_dir" || return 1
  fi

  git worktree remove "$wt_real" || return 1

  if [ "$choice" = "Remove worktree + delete branch" ]; then
    case "$branch" in
      main|master|develop) ;;
      *)
        git branch -d "$branch" 2>/dev/null || git branch -D "$branch"
        ;;
    esac
  fi
}

function gwtls () {
  _require git || return 1
  git wtl
}
