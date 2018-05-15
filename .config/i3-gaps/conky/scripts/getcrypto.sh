#!/bin/bash

# Display the most famous crypto-moneys in a certain LIMIT
LIMIT=4

i3bar_print() {
    echo "    {
        \"full_text\":\"${1}\","
    echo '
        "border": "#E5E700",
        "border_bottom":2, "border_top":0, "border_left":0, "border_right":0
    },'
}

out=$(curl -s "https://api.coinmarketcap.com/v2/ticker/?convert=EUR&limit=${LIMIT}")

# shellcheck disable=SC2181
if [ "$?" -ne 0 ]; then
    i3bar_print '[ getcrypto: bad request from curl ]'
    exit 1
fi

# Get crypto-money names
symbol=$(echo "$out" | sed -n 's%.*symbol": "\(.*\)",.*%\1%p')

if [ "$(echo "$symbol" | wc -l)" -ne ${LIMIT} ]; then
    i3bar_print '[ getcrypto: bad content ]'
    exit 1
fi

# Get the conversion into EUR
value=$(echo "$out" | grep EUR -A 1 | sed -n 's%.*price": \(.*\),%\1%p')

if [ "$(echo "$value" | wc -l)" -ne ${LIMIT} ]; then
    i3bar_print '[ getcrypto: bad content ]'
    exit 1
fi

# Round the EUR values
value=$(echo "$value" | xargs printf '%.2f€\n')

# Beautify the display
res=$(paste -d' ' <(echo "$symbol") <(echo "$value"))
res=$(echo "$res" | sed -e 's/BTC//;s/ETH//;s/BCH//g;s/XRP//' | tr '\n' ' ')
res=$(echo "$res" | head --bytes -2 | sed -e 's/ /  /g')

# Display the result into the i3 bar
i3bar_print "$res"
