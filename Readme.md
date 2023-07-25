# OP Erigon Docker Compose

An easy to launch docker compose implementation for [op-erigon](https://github.com/testinprod-io/op-erigon)

This tool automatically download and extract backup snapshot before launching op-erigon

## How to launch

Copy .env.example to .env

Update ROLLUP_HISTORICALRPC and L1_RPC_ENDPOINT in .env

Then just run

```
docker compose up -d
```

That's simple!

In case you want to launch your op-erigon dedicated server with monitoring and alerting system, we encourage you to try out our deployer.

[Upnode Deploy | https://deploy.upnode.org](https://deploy.upnode.org)
