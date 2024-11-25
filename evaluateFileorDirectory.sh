#!/bin/bash
if [ -d ../cypress-install ]; then
    echo "It's a directory."
elif [ -f ../cypress-install ]; then
    echo "It's a file."
else
    echo "It doesn't exist."
fi
