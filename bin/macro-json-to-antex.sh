#!/bin/sh

jq -r 'to_entries | .[] | "\\newcommand\(.key)[\(.value.nargs)]{\(.value.body)}"'
