function bin2dec () { echo "ibase=2; ${1}" | bc; }
function dec2bin () { echo "obase=2; ${1}" | bc; }
function dec2hex () { echo "obase=16; ${1}" | bc; }
function hex2dec () { echo "ibase=16; $(echo "${1}" | tr '[a-z]' '[A-Z]')" | bc; }
