#!/bin/bash 

read -p "Enter your name: " name
echo "Your name is: $name"

if [[ $name == "ankit" ]]; then
    echo "Hello admin"
else
    echo "Invalid input"
fi
