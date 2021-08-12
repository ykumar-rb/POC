#!/bin/sh
while true
do
        echo "Writing log to a file"
  echo '{"message":"Logging for poc of efk stack, chill !!"}' >> /app/example-log.log
        sleep 5
done
