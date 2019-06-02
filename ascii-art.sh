#!/bin/bash
# generate randomly selected ascii art from cowsay, with text from fortune.

# old
# COWSAY_ANIMAL_LIST=$(cowsay -l | tail -n +2)
# COWSAY_ANIMAL_COUNT=$(echo $COWSAY_ANIMAL_LIST | wc -w ) 
# COWSAY_ANIMAL_RND_NO=$((1 + RANDOM % ${COWSAY_ANIMAL_COUNT} ))
# COWSAY_RANDOM_ANIMAL=$(echo ${COWSAY_ANIMAL_LIST} | awk -v animal_num=${COWSAY_ANIMAL_RND_NO} '{print $animal_num }')


SHUF_CMD=gshuf
COWSAY_FILE_DIR=/usr/local/Cellar/cowsay/3.04/share/cows/*.cow
COWSAY_RANDOM_ANIMAL=$(ls -1 ${COWSAY_FILE_DIR} | ${SHUF_CMD} -n 1)


#echo ${COWSAY_ANIMAL_COUNT}
#echo ${COWSAY_ANIMAL_LIST} 
#echo ${COWSAY_ANIMAL_LIST} | wc -l
#echo ${COWSAY_ANIMAL_RND_NO}
#echo ${COWSAY_RANDOM_ANIMAL}

echo " your random animal is " ${COWSAY_RANDOM_ANIMAL}

fortune -s | cowsay -f ${COWSAY_RANDOM_ANIMAL}



