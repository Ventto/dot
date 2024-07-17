#!/bin/bash

git-stats() {
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
