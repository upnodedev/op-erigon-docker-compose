#!/bin/sh

if [ ! -e "/home/erigon/.local/share/erigon/SNAPSHOT_DOWNLOADED" ]; then
  rm -rf /home/erigon/.local/share/erigon/chaindata
  wget -c https://op-erigon-backup.mainnet.testinprod.io -O - | tar -xz -C /home/erigon/.local/share/erigon
  touch /home/erigon/.local/share/erigon/SNAPSHOT_DOWNLOADED
fi

erigon \
  --datadir="/home/erigon/.local/share/erigon" \
  --private.api.addr=localhost:9090 \
  --http.addr=0.0.0.0 \
  --http.port=8545 \
  --http.corsdomain="*" \
  --http.vhosts="*" \
  --authrpc.addr=0.0.0.0 \
  --authrpc.port=8551 \
  --authrpc.vhosts="*" \
  --authrpc.jwtsecret="/home/erigon/jwtsecret/jwt.hex" \
  --rollup.sequencerhttp="https://mainnet-sequencer.optimism.io" \
  --rollup.historicalrpc=$ROLLUP_HISTORICALRPC \
  --rollup.disabletxpoolgossip=true \
  --chain=optimism-mainnet \
  --nodiscover