#!/bin/sh
wget -o ./statuses/index.html http://prtstatus.wvu.edu/api/$(date +%s)/?format=json

old_status="$(jq .status "index.html?format=json")"
new_status="$(jq .status "index.html?format=json.1")"
if ($new_status = $old_status); then
	echo "Status has not changed"
else
	echo "status has changed to $new_status"
fi

echo $old_status
echo $new_status

rm index.html?format=json.*
