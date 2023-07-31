#!/bin/sh

op-node \
  --l1=$L1_RPC_ENDPOINT \
  --l1.rpckind=alchemy \
  --l2="http://erigon:8551" \
  --l2.jwt-secret="/home/erigon/jwtsecret/jwt.hex" \
  --network=$NETWORK \
  --rpc.addr=0.0.0.0 \
  --rpc.port=9545