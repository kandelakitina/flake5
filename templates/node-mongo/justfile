# Justfile for nodejs

set shell := ["fish", "-c"]

dev:
    nodemon index.js

mongols:
    -lsof -i -P -n | grep mongod

mongostart:
    mkdir -p ./.database
    touch ./.database/mongo.conf
    mongod --config ./mongo.conf
    just mongols

mongostop:
    -mongosh --eval "db.getSiblingDB('admin').shutdownServer()"

mongoremove:
    rm -rf ./.database
