#!/bin/bash
# SID:

{

: ${BANNER_TEXT:="I've read & consent to terms in IS user agreem't."}

if [ -f ./banner ]; then
    cat ./banner > /etc/issue
else
# There was a regular-expression matching various banners, needs to be expanded
expanded=$(echo "$BANNER_TEXT" | sed 's/\[\\s\\n\][+*]/ /g;s/\\//g;s/[^-]- /\n\n-/g')
formatted=`echo "$expanded" | fold -sw 80`

cat <<EOF >/etc/issue
$formatted
EOF

printf "\n" >> /etc/issue
fi

} &>> ${LOGFILE}

