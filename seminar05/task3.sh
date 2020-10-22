#!/bin/bash

a='^issue-[0-9]* .*'

if ! grep -qE "$a" "$1"; then
	echo "Dude wrong commit message format."
	exit 1
fi