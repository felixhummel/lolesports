#!/bin/bash
set -exo pipefail

game_id=$1
[[ -f vods/$game_id.json ]] || curl http://euw.lolesports.com/api/game/$game_id.json > vods/$game_id.json
cat vods/$game_id.json | jq '.vods.vod.URL' -r
