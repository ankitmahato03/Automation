#!/bin/bash

echo "Enter the number whatever You want"
read num
sum=0

for ((i=1;i<=$num;i++)); do
        sum=$((sum + i))
done
echo "sum of n integer is $sum"