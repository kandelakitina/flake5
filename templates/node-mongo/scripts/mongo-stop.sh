#!/usr/bin/env bash

DBPATH="$HOME/mongo-data"
PIDFILE="$DBPATH/mongod.pid"

if [ -f "$PIDFILE" ] && kill -0 $(cat "$PIDFILE") 2>/dev/null; then
    kill $(cat "$PIDFILE") 2>/dev/null
    rm -f "$PIDFILE"
    echo "MongoDB stopped"
else
    echo "MongoDB is not running"
fi
