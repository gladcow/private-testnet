# Setting private QWC testnet network

Having private [QWC](https://qwertycoin.org/) testnet network can be very useful, as you can play around
with QWC without risking making expensive mistakes on real network. However,
it is not clear how to set up a private testnet network. In this example, this
is demonstrated.

## Prerequisite

The instructions below have been prepared
based on Linux. 

## Testnet network

The testnet QWC network will include 3 nodes, each with its own blockchain database
and a 2 corresponding wallet connected to 2 first nodes on a single computer. The three testnet nodes will be listening at the following ports 58080, 38080 and 48080, respectively. As a result, testnet folder structure will be following:

```bash
./testnet/
├── node_01
├── node_02
├── node_03
├── wallet_01.bin
├── wallet_01.bin.address.txt
├── wallet_01.bin.keys
├── wallet_01.log
├── wallet_02.bin
├── wallet_02.bin.address.txt
├── wallet_02.bin.keys
├── wallet_02.log

3 directories, 8 files
```


## Step 1: Create testnet wallets

Two nodes will have a corresponding wallet. Thus we create the wallets first.
I assume that the wallets will be called `wallet_01.bin`,
`wallet_02.bin`. Also, I assume that the wallets will be located
in `~/private_testnet` folder.

For the testnet network, I prefer to have fixed addresses for each wallet and no password.
The reason is that it is much easier to work with such testnet wallets.

Execute the following commands to create the wallets without password.

```bash
./prepare_testnet.sh
```

## Step 2: Start network

```bash
./tmux_privateqwc.sh
```

## Step 3: Start mining

How you mine is up to you now. You can mine only for the first wallet, and keep other two empty for now,
or mine in two nodes, or all three of them.

For example, to mine into two first wallets, the following commands can be used:


in node_01 (mining to the first wallet):
```
start_mining  9wviCeWe2D8XS82k2ovp5EUYLzBt9pYNW2LXUFsZiv8S3Mt21FZ5qQaAroko1enzw3eGr9qC7X1D7Geoo2RrAotYPwq9Gm8 1
```

## Making transfers

Newly mined blocks require confirmation of 60 blocks, before they can be used. So before you can make any transfers between the wallets, we need to mine at least 60 blocks. Until then, the wallets will have `unlocked balance` equal to 0. In contrast, for regular transfers between wallets to be unlocked it takes 10 blocks.


## How can you help?

Constructive criticism, code and issues are always welcomed. They can be made through github.
