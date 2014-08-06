#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./bis.config.sh

mkdir -p "$data"import ;
rm "$data"import/*.nt ;

#ls -1 "$data"*.rdf | grep -vE "Structure|prov" | while read i ; do rapper -g "$i" >> "$data"import/graph.data.nt ; done
#ls -1 "$data"*.rdf | grep -E "Structure|prov" | while read i ; do file=$(basename "$i"); dataSetCode=${file%.*}; rapper -g "$i" > "$data"import/"$dataSetCode".nt ; done


#for i in "$data"*.Structure.rdf ; do rapper -g "$i" >> "$data"import/graph.meta.nt ; done

#ls -1 "$data"*.rdf | grep -v Structure | while read i ; do rapper -g "$i" >> "$data"import/graph.data.nt ; done

#find "$data" -name "*[!Structure|prov].rdf" | while read i ; do file=$(basename "$i"); dataSetCode=${file%.*};
for i in "$data"*.rdf ; do file=$(basename "$i"); dataSetCode=${file%.*}; rapper -g "$i" > "$data"import/"$dataSetCode".nt ; done;



#real    65m8.998s
#user    61m52.876s
#sys     1m23.693s

#-rw-rw-r-- 1 sarcap sarcap 36112292923 Feb  5 18:11 graph.data.nt
#-rw-rw-r-- 1 sarcap sarcap    79932845 Feb  5 17:29 graph.meta.nt
