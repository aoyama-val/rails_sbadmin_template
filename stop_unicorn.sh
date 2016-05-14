#!/bin/bash

pidfile="/tmp/unicorn.pid"

if [ -f "$pidfile" ]; then
    kill -QUIT $(cat $pidfile)
    rm -f "$pidfile"
fi
