#!/bin/bash

. ./bis.config.sh

cd "$data"
tar -cvzf meta.tar.gz *.Structure.rdf bis.*

tar -cvzf data.tar.gz *.rdf --exclude='*.Structure.rdf' --exclude='bis.*'

