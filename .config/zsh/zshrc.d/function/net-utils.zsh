myip () {
    wget -qqO- 'https://duckduckgo.com/?q=ip' | \
        grep -oE "[0-9]{1,3}(\.[0-9]{1,3}){3}"
}
