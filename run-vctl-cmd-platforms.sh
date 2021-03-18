#!/usr/bin/env bash


if [ $# -eq 0 ]
then
echo "No vctl command supplied. Must give command. Example: status"
exit 1
fi

agentlist=(forwarderagent-5.1 listeneragent-3.3)
containerlist=(fwd0 fwd1 fwd2 fwd3 fwd4 fwd5 fwd6 fwd7 fwd8 fwd9)

for i in "${containerlist[@]}"
do
	echo "Running vctl $1 on ${i}"
	docker exec -u volttron "${i}" /home/volttron/.local/bin/vctl $1
done


