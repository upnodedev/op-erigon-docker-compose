#!/bin/sh

detect_l1_kind() {
  local rpc_url="$1"
  local chain_id="$2"

  case "$rpc_url" in
    *alchemy.com*) echo "alchemy" ;;
    *quicknode.com* | *quiknode.pro*) [ "$chain_id" -eq 1 ] && echo "quicknode" || echo "basic" ;;
    *) echo "basic" ;;
  esac
}

L1_KIND=$(detect_l1_kind "$L1_RPC_ENDPOINT" 1)

op-node \
  --l1=$L1_RPC_ENDPOINT \
  --l1.rpckind=$L1_KIND \
  --l1.beacon=$L1_BEACON_ENDPOINT \
  --l2="http://erigon:8551" \
  --l2.jwt-secret="/home/erigon/jwtsecret/jwt.hex" \
  --network=$NETWORK \
  --rpc.addr=0.0.0.0 \
  --rpc.port=9545