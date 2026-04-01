# zed [DIR]: pick git repos under DIR with fzf and open them in Zed
function zed() {
	_require fzf fdfind git || return 1

	local root="${1:-$PWD}"
	local out
	local fzf_status
	local repo branch git_dir repo_kind repo_state
	local -a repos selected entries
	local -a _zed=(flatpak run dev.zed.Zed)

	[[ -d "$root" ]] || {
		echo "Directory not found: $root" >&2
		return 1
	}

	root="${root:A}"

    # If no git repository open given folder path
    repo_search="$(fdfind -HI -g '.git' "$root" 2>/dev/null)"
    if [[ -z $repo_search ]]; then
		"${_zed[@]}" "$root"
        return 0
    fi

	repos=("${(@f)$(echo "$repo_search" | sed 's#/.git/*$##' | sort -u)}")

	for repo in "${repos[@]}"; do
		branch="$(git -C "$repo" branch --show-current 2>/dev/null)"
		[[ -z "$branch" ]] && branch="$(git -C "$repo" rev-parse --short HEAD 2>/dev/null)"
		[[ -z "$branch" ]] && branch="-"

		if [[ -n "$(git -C "$repo" status --porcelain 2>/dev/null)" ]]; then
			repo_state="*"
		else
			repo_state="✓"
		fi

		git_dir="$(git -C "$repo" rev-parse --git-dir 2>/dev/null)"
		if [[ "$git_dir" == *"/worktrees/"* ]]; then
			repo_kind="wt"
		else
			repo_kind="repo"
		fi

		entries+=("${repo}\t[${repo_kind}]\t${branch}\t${repo_state}")
	done

	out="$(
		printf '%b\n' "${entries[@]}" | fzf -m \
			--prompt='Git repos > ' \
			--delimiter=$'\t' \
			--with-nth=1,2,3,4 \
			--preview-window='right,60%,border-left' \
			--preview '
        repo=$(printf "%s" {} | cut -f1)

        branch=$(git -C "$repo" branch --show-current 2>/dev/null)
        [ -z "$branch" ] && branch=$(git -C "$repo" rev-parse --short HEAD 2>/dev/null)
        [ -z "$branch" ] && branch="-"

        git_dir=$(git -C "$repo" rev-parse --git-dir 2>/dev/null)
        if printf "%s" "$git_dir" | grep -q "/worktrees/"; then
          kind="wt"
        else
          kind="repo"
        fi

        if [ -n "$(git -C "$repo" status --porcelain 2>/dev/null)" ]; then
          state="dirty"
        else
          state="clean"
        fi

        printf "Path:    %s\n" "$repo"
        printf "Type:    %s\n" "$kind"
        printf "Branch:  %s\n" "$branch"
        printf "State:   %s\n" "$state"
        printf "\n"

        printf "Worktrees:\n"
        git -C "$repo" worktree list 2>/dev/null || true
        printf "\n"

        printf "Status:\n"
        git -C "$repo" status -sb 2>/dev/null || true
      ' | cut -f1
	)"

	fzf_status=$?
	((fzf_status != 0)) && return "$fzf_status"

	[[ -z "$out" ]] && return 0

	selected=("${(@f)out}")
	selected=("${(@)selected:#}")

	((${#selected[@]} == 0)) && return 0

	"${_zed[@]}" "${selected[@]}"
}
