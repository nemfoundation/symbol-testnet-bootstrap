# symbol-testnet-bootstrap

Automated setup to deploy and manage Symbol testnet nodes.

:warning: This is for the newer Symbol test network deployments (ie: will use symbol.xym as the network currency mosaic). If you have previously been running a node on the older test networks using nem.xem (pre 0.9.2.1) you will be redeploying your node and syncing with a different network. Any account(s) you might have been using on the old network will have no balance if moving to a new network.

:information_source: Over time as you upgrade to new versions old versions can take up space on disk.  If you run into disk issues b/c of this you can delete all old versions by running `docker system prune -a` which will ask you to confirm `y/n`.  NOTE: this will delete all cached docker images so if you are doing any development with other images it will delete those as well and you will have to re-download

## Environment requirements

The setup scripts are automated using docker. To run a test net node, you will need to have installed the following docker tools:

* [docker](https://docs.docker.com/install/#server)
* [docker-compose](https://docs.docker.com/compose/install/#install-compose)

:information_source: The release images target modern x86 architectures. It has been reported that errors are experienced on some older machines provided. If you run into any related issues, please report in the [slack group (#help)][slack].

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

In short, if you want to be able to interact with your node, you need to run the API assembly.
On the other hand, if you want a node dedicated exclusively confirm transactions, deploy the peer assembly.
You can read more about each assembly [here](node).

3. Run the node with docker-compose.

```
sudo docker-compose up --build --detach
```

You should see docker downloading the container images for the first time. Then it should run the setup and finally startup the service.

To stop all the running services, run ``sudo docker-compose down`` in the same directory you executed the ``up`` command.

## Peer Assembly 

The Peer assembly will set up a [Peer](https://nemtech.github.io/concepts/node.html#peer-node) only node.

## API Harvest Assembly 

The API harvest assembly will set up a Dual purpose [API](https://nemtech.github.io/concepts/node.html#api-node) and [Peer](https://nemtech.github.io/concepts/node.html#peer-node) node, as well as the [REST gateway](https://nemtech.github.io/concepts/node.html#rest-gateway) that transactions can be submitted to and data read from.

You can verify that the node is running by opening a new browser tab with the following URL: ``localhost:3000/chain/height``.

:information_source: The software should expose the port ``3000`` by default. If you cannot access the REST Gateway from outside, it might mean that the port is closed by default by your machine or hosting provider so you will have to open it in order to access from outside the machine.

:information_source: API nodes take up more memory and storage than peer nodes. If you have memory or storage constraints and you are running into issues, it is recommended you switch to running a Peer only node instead.

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
[node]: https://nemtech.github.io/concepts/node.html
[issues]: https://github.com/nemfoundation/symbol-testnet-bootstrap/issues
[slack]: https://join.slack.com/t/nem2/shared_invite/enQtMzY4MDc2NTg0ODgyLWZmZWRiMjViYTVhZjEzOTA0MzUyMTA1NTA5OWQ0MWUzNTA4NjM5OTJhOGViOTBhNjkxYWVhMWRiZDRkOTE0YmU
