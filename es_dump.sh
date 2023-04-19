#!/bin/bash
from=$1
to=$2
arr=()
for item in ${arr[*]}; do 
  docker run --rm -d elasticdump/elasticsearch-dump \
    --input=http://$from:9200/"$item" \
    --output=http://$to:9200/"$item" \
    --type=mapping \
    --limit 10000
  docker run --rm -d elasticdump/elasticsearch-dump \
    --input=http://$from:9200/"$item" \
    --output=http://$to:9200/"$item" \
    --type=settings \
    --limit 10000
  docker run --rm -d elasticdump/elasticsearch-dump \
    --input=http://$from:9200/"$item" \
    --output=http://$to:9200/"$item" \
    --type=data \
    --limit 10000
  echo "$item was sucessfully transferred"
  sleep 5 #workaround docker lag
done
