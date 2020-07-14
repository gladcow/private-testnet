#!/bin/bash

cd ~

TESTNET_PATH=~/private_testnet
# tmux session name
SN=PRIVQWC

tmux kill-session -t $SN

cd $TESTNET_PATH 


# nodes windo
# start node_01 (initial session)
tmux new-session -d -s $SN -n nodes -- sh -ic './qwertycoind --p2p-bind-port 58080 --rpc-bind-port 58081 --hide-my-port --data-dir node_01 --p2p-bind-ip 127.0.0.1 --log-level 2 --fixed-difficulty 1 --add-exclusive-node 127.0.0.1:38080 --add-exclusive-node 127.0.0.1:48080 || read WHATEVER'

# start node_02
tmux split-window -dv
tmux select-pane -t 1
tmux split-window -dh      
tmux send './qwertycoind --p2p-bind-port 38080 --rpc-bind-port 38081 --hide-my-port --log-level 2 --fixed-difficulty 1 --data-dir node_02 --p2p-bind-ip 127.0.0.1 --add-exclusive-node 127.0.0.1:58080 --add-exclusive-node 127.0.0.1:48080 || read WHATEVER' ENTER

# start node_03
tmux select-pane -t 2
tmux send './qwertycoind --p2p-bind-port 48080 --rpc-bind-port 48081 --hide-my-port --log-level 2 --fixed-difficulty 1 --data-dir node_03 --p2p-bind-ip 127.0.0.1 --add-exclusive-node 127.0.0.1:58080 --add-exclusive-node 127.0.0.1:38080 || read WHATEVER' ENTER

# wallets window

# start wallet_01 (first pane in new window)
tmux new-window -n wallets -c $TESTNET_PATH -- sh -ic './simplewallet --daemon-port 58081 --wallet-file wallet_01.bin --password "" --log-file wallet_01.log || read WHATEVER'

# start wallet_02
tmux split-window -dv
tmux select-pane -t 1
tmux send './simplewallet --daemon-port 38081 --wallet-file wallet_02.bin --password "" --log-file wallet_02.log || read WHATEVER' ENTER


# open second (wallets) tmux window
tmux select-window -t 1

# open tmux for this session
tmux a -t $SN
