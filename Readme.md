# OP Erigon Docker Compose

An easy to launch docker compose implementation for [op-erigon](https://github.com/testinprod-io/op-erigon)

This tool automatically download and extract backup snapshot before launching op-erigon

## How to launch

Copy .env.example to .env

Update `L1_RPC_ENDPOINT` (Required), `L1_BEACON_ENDPOINT` (Required) and `ROLLUP_HISTORICALRPC` (Optional) in .env

For `L1_RPC_ENDPOINT`, you can use Alchemy ethereum endpoint (Free plan is sufficient)

For `L1_BEACON_ENDPOINT`, you can use QuickNode if you don't want to host one

Then just run

```
docker network create traefik_proxy
bash generate-jwt.sh
docker compose up -d
```

That's simple!

In case you want to launch your op-erigon dedicated server with monitoring and alerting system, we encourage you to try out our deployer.

[Upnode Deploy | https://deploy.upnode.org](https://deploy.upnode.org)
