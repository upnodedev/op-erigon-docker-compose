#!/bin/sh

if [ ! -e "/home/erigon/.local/share/erigon/SNAPSHOT_DOWNLOADED" ]; then
  rm -rf /home/erigon/.local/share/erigon/chaindata
  while ! wget -c https://op-erigon-backup.$NETWORK.testinprod.io -O /home/erigon/op-erigon-backup.tar.gz
  do
    sleep 3
  done
  tar -xzf /home/erigon/op-erigon-backup.tar.gz -C /home/erigon/.local/share/erigon
  mv /home/erigon/.local/share/erigon/database/chaindata /home/erigon/.local/share/erigon/chaindata
  rm /home/erigon/op-erigon-backup.tar.gz
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
  --rollup.sequencerhttp="https://$NETWORK-sequencer.optimism.io" \
  --rollup.historicalrpc=$ROLLUP_HISTORICALRPC \
  --rollup.disabletxpoolgossip=true \
  --chain=optimism-$NETWORK \
  --db.size.limit=8TB \
  --nodiscover