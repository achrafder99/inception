#!/bin/bash

# Start Redis server
exec redis-server

# Wait for Redis server to start (adjust the sleep duration if needed)
sleep 5

# Set Redis password using redis-cli
redis-cli -a '' <<EOF
CONFIG SET requirepass "1234"
EOF