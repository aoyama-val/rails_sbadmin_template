#!/bin/bash

ps aux | grep '[u]nicorn'

if [ "$?" != 0 ]; then
    echo "Unicorn is not running."
fi
