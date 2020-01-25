# symbol-testnet-bootstrap

Automated setup to deploy and manage Symbol testnet nodes.

:warning: This is for the newer Symbol test network deployments (ie: will use symbol.xym as the network currency mosaic). If you have previously been running a node on the older test networks using nem.xem (pre 0.9.2.1) you will be redeploying your node and syncing with a different network. Any account(s) you might have been using on the old network will have no balance if moving to a new network.

:information_source: Over time as you upgrade to new versions old versions can take up space on disk.  If you run into disk issues b/c of this you can delete all old versions by running `docker system prune -a` which will ask you to confirm `y/n`.  NOTE: this will delete all cached docker images so if you are doing any development with other images it will delete those as well and you will have to re-download

## Environment requirements

The setup scripts are automated using docker. To run a test net node, you will need to have installed the following docker tools:

* [docker](https://docs.docker.com/install/#server)
* [docker-compose](https://docs.docker.com/compose/install/#install-compose)

## Installation

1. Download the [latest release](https://github.com/nemfoundation/symbol-testnet-bootstrap) of the package, or clone the repository directly using Git.

```
git clone https://github.com/nemfoundation/symbol-testnet-bootstrap.git
```

2. Choose the assembly distribution to install.

```
cd symbol-testnet-bootstrap/api-harvest-assembly
```

or...

```
cd symbol-testnet-bootstrap/peer-assembly
```

To choose between one distribution or another, read the [technical reference](https://nemtech.github.io/guides/network/running-a-test-net-node.html#installation).         

3. Run the node with docker-compose.

```
sudo docker-compose up --build --detach
```

You should see docker downloading the container images for the first time, then it should run the setup and finally startup the service.

If you have installed the ``api-harvest-assembly`` distribution, you can verify as well that the node is running by opening a new browser tab with the following URL: ``localhost:3000/chain/height``.

## Contributing

This project is developed and maintained by NEM Foundation. Contributions are welcome and appreciated. You can find [symbol-testnet-bootstrap on GitHub][self];
Feel free to start an issue or create a pull request. Check [CONTRIBUTING](CONTRIBUTING.md) before start.

## Getting help

- [symbol-testnet-bootstrap documentation][docs]
- Join the community [slack group (#sig-testing)][slack] 
- If you found a bug, please [open a new issue][issues]

## License

Copyright 2019-present NEM Foundation

Licensed under the [Apache License 2.0](LICENSE)

[self]: https://github.com/nemfoundation/symbol-testnet-bootstrap
[docs]: http://nemtech.github.io/guides/network/running-a-test-net-node.html
[issues]: https://github.com/nemfoundation/symbol-testnet-bootstrap/issues
[slack]: https://join.slack.com/t/nem2/shared_invite/enQtMzY4MDc2NTg0ODgyLWZmZWRiMjViYTVhZjEzOTA0MzUyMTA1NTA5OWQ0MWUzNTA4NjM5OTJhOGViOTBhNjkxYWVhMWRiZDRkOTE0YmU
