#!/bin/sh
wget -o ./statuses/index.html http://prtstatus.wvu.edu/api/$(date +%s)/?format=json

old_status="$(jq -r .status "index.html?format=json")"
new_status="$(jq -r .status "index.html?format=json.1")"
if [ "$new_status" = "$old_status" ];
then
	echo "Status has not changed"
	rm index.html?format=json.*
	exit 0
else
	echo "status has changed to $new_status"
	mv index.html?format=json.1 index.html?format=json
	return $new_status
fi
