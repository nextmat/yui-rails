#!/bin/bash

ROOT=`pwd`"/vendor/assets"
TMP="`pwd`/tmp/yui3"
# Pull down yui3 sources
git clone  git://github.com/yui/yui3.git tmp/yui3
git fetch
if [  -n "$1" ]
then
    cd $TMP
    echo "checking out ref $1"
    git checkout $1
    cd ../..
else
    echo "you could run this with a checkout ref option, e.g. v3.8.1"
fi

# Copy js/ to javascripts/
find $TMP/build/yui/ -iname '*coverage.js' -exec rm '{}' \;
cp -r $TMP/build/yui/* $ROOT/javascripts/

# remove leftovers
rm -rf $TMP
