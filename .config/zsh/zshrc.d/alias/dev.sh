alias adbkey-fingerprint="awk '{print \$1}' < ${HOME}/.android/adbkey.pub \
    | openssl base64 -A -d -a | openssl md5 -c"
