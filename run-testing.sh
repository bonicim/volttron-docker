#!/usr/bin/env bash

agentlist=(forwarderagent-5.1 listeneragent-3.3)
containerlist=(fwd0 fwd1 fwd2 fwd3 fwd4 fwd5 fwd6 fwd7 fwd8 fwd9)

# Test 1
# restart every volttron
for i in "${containerlist[@]}"
do
	echo "${agentlist[@]}" | xargs -n1 docker exec -u volttron "${i}" /home/volttron/.local/bin/vctl restart
done


# Test 2
# shutdown all platforms
# then restart all platforms
#docker exec -u volttron "${i}" /home/volttron/.local/bin/volttron -vv -l volt.log &



# Test 3 restart just one platform
