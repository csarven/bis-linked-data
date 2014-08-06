#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./bis.config.sh

rm "$data""$agency".prov.retrieval.rdf

echo '<?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:prov="http://www.w3.org/ns/prov#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:sdmx="http://purl.org/linked-data/sdmx#">' > "$data""$agency".prov.retrieval.rdf ;

DataSetCodes=("BIS_M_IBLR" "BIS_M_IBLN" "BIS_M_CIBL_IB" "BIS_M_CIBL_UR" "BIS_EER" "BIS_TOTAL_CREDIT")
DataSetTitles=(
"International bank positions, by residence"
"International bank positions, by nationality"
"International bank claims, consolidated - immediate borrower basis"
"International bank claims, consolidated - ultimate risk basis"
"BIS Effective Exchange Rates"
"BIS Credit to non-financial private sector"
)
#DataSetAltTitles=("Consolidated Banking Statistics - Immediate Risk Basis" "Consolidated Banking Statistics - Ultimate Risk Basis" "Locational Banking Statistics - By Residence" "Locational Banking Statistics - By Nationality" "Effective Exchange Rates" "BIS Credit to non-financial private sector")

DataStructureURLs=(
"http://stats.bis.org/lbs-r?format=sdmx-ml-metadata"
"http://stats.bis.org/lbs-n?format=sdmx-ml-metadata"
"http://stats.bis.org/cbs-ir?format=sdmx-ml-metadata"
"http://stats.bis.org/cbs-ur?format=sdmx-ml-metadata"
"http://stats.bis.org/eer?format=sdmx-ml-metadata"
"http://stats.bis.org/creditopriv?format=sdmx-ml-metadata"
)
#123456
#1-11?1
DataSetURLs=(
"http://stats.bis.org/bis-stats-tool/org.bis.stats.ui.StatsApplication/ResultDownload?format=sdmx-ml-data&amp;compress=true&amp;bookmark=true&amp;query=eJxFjEEKwjAQRX%2BkEkQEV%2BJ1kjitgUrrJFqykLmMl%2FIy3kToNArOYt5%2FDPMB0z0fH8HexzSRl%2BByCme6EA6qKatK9D3LyWXX9sMEnS1gX8qV8q08GqPboGmZrjWZBcsda%2BzqvxZTN3DB5qs35l%2FMZSRYplFCLrD3mGr4F874kyCe"

"http://stats.bis.org/bis-stats-tool/org.bis.stats.ui.StatsApplication/ResultDownload?format=sdmx-ml-data&amp;compress=true&amp;bookmark=true&amp;query=eJxjYGB0b649uIlBwMkzONzVKd7ZMSTY2cPV15VBDMgNDgFy4z2dfPziXRxDHN18%2FMMZgICbgYF9P5BmAtL36v%2F%2F%2F8%2FICOQxMrC4BbkGglmMIAokz8DMwAvWDzTY1d0%2FKJKBE8wNiQxwZWAP8wyOdw6JRNIMAKDzHyY%3D"

"http://stats.bis.org/bis-stats-tool/org.bis.stats.ui.StatsApplication/ResultDownload?format=sdmx-ml-data&amp;compress=true&amp;bookmark=true&amp;query=eJxFjDEOwjAMRX9QpQhYWDmOHVyIFERpIqpOPgoDN%2BEiHIONqwQ3DHh578nSB9zx8XwTdhzzJKyBSg4nOQv2lrlYaoicNLIeqFCfLhPstoB%2FGVfGz73W6pyVQ9ePcm3mFix%2FdNi0iUKcBOufz4PAjzJoKDP8LeYm%2F4kvwq0hAQ%3D%3D"

"http://stats.bis.org/bis-stats-tool/org.bis.stats.ui.StatsApplication/ResultDownload?format=sdmx-ml-data&amp;compress=true&amp;bookmark=true&amp;query=eJxjYGB0bwlyjWIQcPIMDnd1ind2DAl29nD1dWWQBHKDQ4DceGdPJ5%2F40KB4F8cQRzcf%2F3AGIGBiYGC%2FCqXv1f%2F%2F%2F5%2BREchjZGBxC3INBLMYA6HqGJgZOMFGhEQGuDKwB7kGxDuHRDKwh3kGgxkIbQDeYh12"

"http://stats.bis.org/bis-stats-tool/org.bis.stats.ui.StatsApplication/ResultDownload?format=sdmx-ml-data&amp;compress=true&amp;bookmark=true&amp;query=eJxjYGB0b97An88g4OQZHO7qFO%2FsGBLs7OHq68ogBBVxdQ1ycQxxdPPxD2eAAPY1QIIVSN%2Br%2F%2F%2F%2FPyMjkMfIwOIW5BoIZjH6ghQxATEzAwdQd3xIZIArAxeI5eQY7O0awsAR5OoW7xjk6oikEwATchvD"

"http://stats.bis.org/bis-stats-tool/org.bis.stats.ui.StatsApplication/ResultDownload?format=sdmx-ml-data&amp;compress=true&amp;bookmark=true&amp;query=eJxNjNsJQjEQRCdyRXyBFdiAWEQee%2FVKNJisBL%2B2FD9swfYsReLqh7gwnDkMLGB29%2B1rg5UbSiUn3nLxezoS1qqFVYUT2yg%2BUxhYgmXbx1ShNwYmD%2BVc%2Bby11oxRM%2Bj6TOdvMx9gpOmwdCnnVCkX8XzFjL1EOgV1LLT%2FVkzVbDhcCv99ewMlJyWd"
)

#        downloadURL=http://stats.bis.org/"$DataSetCode"?format="$GD"

Get=("sdmx-ml-metadata" "sdmx-ml-data")

count=${#DataSetCodes[@]}
index=0
while [ "$index" -lt "$count" ]; do
#for DataSetCode in "${DataSetCodes[@]}" ; do
    DataSetCode=${DataSetCodes[$index]}
    DataSetTitle=${DataSetTitles[$index]}
    DataSetURL=${DataSetURLs[$index]}
    DataStructureURL=${DataStructureURLs[$index]}

    for GD in "${Get[@]}" ; do
        echo "$DataSetCode $GD" ;

        if [ "$GD" == "sdmx-ml-data" ]
        then
            DataType="http://purl.org/linked-data/sdmx#DataSet"
            DataTypeLabel="Data"
            DataTypePath=""
            downloadURL="${DataSetURL}"

            echo '
            <rdf:Description rdf:about="http://bis.270a.info/dataset/'"$DataSetCode"'">
                <dcterms:title>'"$DataSetTitle"'</dcterms:title>
            </rdf:Description>' >> "$data""$agency".prov.retrieval.rdf ;
        else
            DataType="http://purl.org/linked-data/sdmx#DataStructureDefinition"
            DataTypeLabel="Structure"
            DataTypePath=".Structure"
            downloadURL="${DataStructureURL}"
        fi
        sleep 1
        dtstart=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
        dtstartd=$(echo "$dtstart" | sed 's/[^0-9]*//g') ;

#        wget -c -t 1 --timeout 300 --no-http-keep-alive "$downloadURL" -O "$data""$DataSetCode""$DataTypePath".xml;

        sleep 1
        dtend=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
        dtendd=$(echo "$dtend" | sed 's/[^0-9]*//g') ;

        echo '
        <rdf:Description rdf:about="http://bis.270a.info/provenance/activity/'$dtstartd'">
            <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
            <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'"$dtstart"'</prov:startedAtTime>
            <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'"$dtend"'</prov:endedAtTime>
            <prov:wasAssociatedWith rdf:resource="http://csarven.ca/#i"/>
            <prov:used rdf:resource="https://launchpad.net/ubuntu/+source/wget"/>
            <prov:used>
                <rdf:Description rdf:about="'"$downloadURL"'">
                    <foaf:page rdf:resource="http://stats.bis.org/"/>
                    <dcterms:identifier>'$DataSetCode'</dcterms:identifier>
                    <dcterms:title xml:lang="en">'"$DataSetTitle"'</dcterms:title>
                </rdf:Description>
            </prov:used>
            <prov:generated>
                <rdf:Description rdf:about="http://bis.270a.info/data/'"$DataSetCode"''"$DataTypePath"'.xml">
                    <dcterms:identifier>'"$DatasetCode"'</dcterms:identifier>
                    <dcterms:title xml:lang="en">'"$DataSetTitle"'</dcterms:title>
                </rdf:Description>
            </prov:generated>
            <rdfs:label xml:lang="en">Retrieved '"$DataSetCode"' '"$DataTypeLabel"'</rdfs:label>
            <rdfs:comment xml:lang="en">'"$DataTypeLabel"' of dataset '"$DataSetCode"' retrieved from source and saved to local filesystem.</rdfs:comment>
        </rdf:Description>' >> "$data""$agency".prov.retrieval.rdf ;
    done

    let "index++"
done

echo -e "\n</rdf:RDF>" >> "$data""$agency".prov.retrieval.rdf ;

