alias leaks='valgrind --leak-check=full --show-leak-kinds=all'

# shellcheck disable=SC2142
alias adbkey-fingerprint='awk "{print \$1}" < "${HOME}/.android/adbkey.pub" \
    | openssl base64 -A -d -a | openssl md5 -c'
alias monitor="bashtop"

alias fix-trailing-space="fd --type f --exec sed -i 's/[[:space:]]\+$//' {} \;"
