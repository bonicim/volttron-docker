#!/usr/bin/env bash
# set -o xtrace    # prints every expression before executing it

agentlist=(forwarderagent-5.1 listeneragent-3.3 platform_driveragent-4.0)
containerlist=(fwd0 fwd1 fwd2 fwd3 fwd4 fwd5 fwd6 fwd7 fwd8 fwd9)

echo 'Stopping containers'
for i in "${containerlist[@]}"
do
  docker stop "${i}"
done


for i in "${containerlist[@]}"
do
  docker start "${i}"
done


for i in "${containerlist[@]}"
do
  docker exec -u volttron "${i}" /home/volttron/.local/bin/volttron -vv -l volt.log &
done

#for i in "${containerlist[@]}"
#do
#  echo "${agentlist[@]}" | xargs -n1 docker exec -u volttron "${i}" /home/volttron/.local/bin/vctl restart
#done