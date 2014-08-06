#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./bis.config.sh
#exit;
echo "Removing $db";
rm -rf "$db";

##RDF/XML
##ls -1S "$data"*.rdf | grep -vE "(Structure|prov).rdf" | while read i ; do file=$(basename "$i"); dataSetCode=${file%.*}; java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/"$dataSetCode" "$i"; done ;

ls -1S "$data"import/*.nt | grep -vE "(Structure|bis).nt" | while read i ; do file=$(basename "$i"); dataSetCode=${file%.*}; java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/"$dataSetCode" "$i"; done ;

#"$data""$agency".prov.archive.nt \
#"$data"bis.property.meta.nt \
#"$data"bis.dataset.names.nt \

java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta \
"$data"import/*.Structure.nt \
"$data""$agency".prov.retrieval.rdf \
"$data"bis.exactMatch.bfs.nt \
"$data"bis.exactMatch.bis.nt \
"$data"bis.exactMatch.dbpedia.currency.nt \
"$data"bis.exactMatch.dbpedia.nt \
"$data"bis.exactMatch.ecb.currency.nt \
"$data"bis.exactMatch.ecb.nt \
"$data"bis.exactMatch.eurostat.nt \
"$data"bis.exactMatch.fao.nt \
"$data"bis.exactMatch.frb.currency.nt \
"$data"bis.exactMatch.geonames.nt \
"$data"bis.exactMatch.hr.nt \
"$data"bis.exactMatch.imf.nt \
"$data"bis.exactMatch.oecd.currency.nt \
"$data"bis.exactMatch.qudt.currency.nt \
"$data"bis.exactMatch.transparency.nt \
"$data"bis.exactMatch.uis.currency.nt \
"$data"bis.exactMatch.uis.nt \
"$data"bis.exactMatch.worldbank.currency.nt \
"$data"bis.exactMatch.worldbank.nt

./bis.tdbstats.sh

