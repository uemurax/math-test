#!/bin/sh

jq -r 'to_entries | map({"key": .key, "value": .value.body}) | from_entries'
