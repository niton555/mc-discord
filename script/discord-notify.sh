#!/bin/bash
tail -n0 -F /logs/latest.log |
grep --line-buffered -f /script/pattern.txt |
grep --line-buffered -vf /script/exclusive.txt |
sed -u -e 's/.*\]: //g' -e 's/left the game/がログアウトしました/g' -e 's/joined the game/がログインしました/g' -e 's/has made the advancement/が実績を達成しました/g' -e 's/was slain by/は殺害された/g' -e 's/fell from a high place/は高いところから落ちた/g' -e 's/hit the ground too hard/は地面に強く激突した/g' -e 's/fell out of the world/は奈落の底に落ちた/g' -e 's/tried to swim in lava/は溶岩遊泳を試みた/g' -e 's/was shot by/は射抜かれた/g' -e 's/Rcon: Stopping the server/サーバーが停止しました/g' -e 's/Starting Minecraft server on \*:25565/[サーバーが起動しました]/g' -e 's/^/"/g' -e 's/$/"/g' |
tee >(xargs -I @ curl -s -H "Content-Type: application/json" -X POST -d "{\"username\": \"${username}\", \"content\":\"@\"}" ${webhookurl} )