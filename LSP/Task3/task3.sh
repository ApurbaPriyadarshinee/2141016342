#!/bin/bash

# Declare a string variable
name="APURBA"

# Declare an integer variable
age=21

# Use if-else to print a message based on the value of the integer
if [ "$age" -ge 18 ]; then
    echo "$name is an adult."
else
    echo "$name is a minor."
fi
