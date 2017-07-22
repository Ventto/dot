bin2dec () { echo "ibase=2; ${1}" | bc; }
dec2bin () { echo "obase=2; ${1}" | bc; }
dec2hex () { echo "obase=16; ${1}" | bc; }
hex2dec () { echo "ibase=16; $(echo "${1}" | tr '[a-z]' '[A-Z]')" | bc; }
