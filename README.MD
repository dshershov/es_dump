# ElasticSearch migration of indexes
Migrate your indexes between elastic's using docker and elasticdump/elasticsearch-dump image

## Installation
1. Get indexes list for migration `curl -k http://<FROM>:9200/_cat/indices |awk '{ print $3 }' > ~/Downloads/text1.txt`
2. Parse `tr '\n' ' ' < ~/Downloads/text1.txt`
3. Copy list of indexes to `arr` into the `es_dump.sh` script

## Usage
* Run docker
* Run script with the next command `./es_dump.sh $1 $2`, which two parameters are:
1. $1 - IP Adress parameter where you setting up FROM copy indexes
2. $1 - IP Adress parameter where you setting up TO copy indexes
