#!/bin/bash
# SID:

login_banner_text="--[\s\n]+WARNING[\s\n]+--[\s\n]*This[\s\n]+system[\s\n]+is[\s\n]+for[\s\n]+the[\s\n]+use[\s\n]+of[\s\n]+authorized[\s\n]+users[\s\n]+only.[\s\n]+Individuals[\s\n]*using[\s\n]+this[\s\n]+computer[\s\n]+system[\s\n]+without[\s\n]+authority[\s\n]+or[\s\n]+in[\s\n]+excess[\s\n]+of[\s\n]+their[\s\n]*authority[\s\n]+are[\s\n]+subject[\s\n]+to[\s\n]+having[\s\n]+all[\s\n]+their[\s\n]+activities[\s\n]+on[\s\n]+this[\s\n]+system[\s\n]*monitored[\s\n]+and[\s\n]+recorded[\s\n]+by[\s\n]+system[\s\n]+personnel.[\s\n]+Anyone[\s\n]+using[\s\n]+this[\s\n]*system[\s\n]+expressly[\s\n]+consents[\s\n]+to[\s\n]+such[\s\n]+monitoring[\s\n]+and[\s\n]+is[\s\n]+advised[\s\n]+that[\s\n]*if[\s\n]+such[\s\n]+monitoring[\s\n]+reveals[\s\n]+possible[\s\n]+evidence[\s\n]+of[\s\n]+criminal[\s\n]+activity[\s\n]*system[\s\n]+personal[\s\n]+may[\s\n]+provide[\s\n]+the[\s\n]+evidence[\s\n]+of[\s\n]+such[\s\n]+monitoring[\s\n]+to[\s\n]+law[\s\n]*enforcement[\s\n]+officials."
# There was a regular-expression matching various banners, needs to be expanded
expanded=$(echo "$login_banner_text" | sed 's/\[\\s\\n\][+*]/ /g;s/\\//g;s/[^-]- /\n\n-/g')
formatted=`echo "$expanded" | fold -sw 80`

cat <<EOF >/etc/issue
$formatted
EOF

printf "\n" >> /etc/issue