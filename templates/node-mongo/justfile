# Justfile for nodejs

set shell := ["fish", "-c"]

mongols:
    -lsof -i -P -n | grep mongod

mongostart:
    mongod --config ./mongo.conf
    just mongols

mongostop:
    -mongosh --eval "db.getSiblingDB('admin').shutdownServer()"

mongoremove:
    rm -rf ./.database
