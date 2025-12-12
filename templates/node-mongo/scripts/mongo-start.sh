#!/usr/bin/env bash

DBPATH="$HOME/mongo-data"
PORT=27017
BIND_IP=127.0.0.1
PIDFILE="$DBPATH/mongod.pid"

mkdir -p "$DBPATH"

# Check if MongoDB is already running
if [ -f "$PIDFILE" ] && kill -0 $(cat "$PIDFILE") 2>/dev/null; then
    echo "MongoDB already running on port $PORT"
    exit 0
fi

echo "Starting MongoDB..."
mongod --dbpath "$DBPATH" --bind_ip "$BIND_IP" --port "$PORT" --quiet \
    --fork --logpath "$DBPATH/mongod.log" --pidfilepath "$PIDFILE"

# Wait until MongoDB is ready
echo -n "Waiting for MongoDB to be ready"
until mongosh --quiet --eval "db.adminCommand('ping')" &>/dev/null; do
    echo -n "."
    sleep 0.5
done
echo " ready!"

# Open MongoDB shell
mongosh
