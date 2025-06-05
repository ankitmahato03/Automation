#!/bin/bash

echo "hello world"

<<comment 
Before excute the script make sure script file must have 
execute permission 
comment

#ls -ltr it to check the permission


age=24
name="Ankit"
Company="Adani_Ai_labs"

echo "My name is ${name} i am ${age} year old and i worked for ${Company}"

Hostname=$(hostname)

echo "i am ${Hostname} the user"


<<comment
if yu want no one can change your varibles then u 
can use 
comment

readonly Collage="MAKAUT"

echo "hey guys i am graduate from ${Collage}"


#Arrays 

myBucket=(20 50 100% "aam lelo " adani labs SIRIUS_DIGITEK)

echo "i worked for ${myBucket[4]}"

#to find the no of values in the arrays 

echo "Number of values in arrays are ${myBucket[*]}"

# to get specific rane of valuse 

echo "the las two values are ${myBucket[*]:4:5}"



# to update the array with new values 

myBucket+=(ACC Ambuja)

echo "${myBucket}"
