#!/bin/sh
wget -o ./statuses/index.html http://prtstatus.wvu.edu/api/$(date +%s)/?format=json

diff_status="$(diff "index.html?format=json" "index.html?format=json.1")"

if [ "$diff_status" ]
then
	echo "Status has changed"
	echo "$diff_status"
	mv index.html?format=json.1 index.html?format=json
	exit 1
else
	echo "Status has not changed"
	rm index.html?format=json.*
	exit 0
fi
