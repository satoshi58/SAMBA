#!/bin/bash

VOLUME=$1
if [ -z "$1" ]
then
	VOLUME="/root"
fi
echo "share ${VOLUME}"

docker run \
  -it \
  -p 137:137 \
  -p 138:138 \
  -p 139:139 \
  -p 445:445 \
  -v ${VOLUME}:/home/samba/ \
  --name samba \
  samba
