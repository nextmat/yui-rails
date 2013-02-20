#!/bin/bash

ROOT=`pwd`"/vendor/assets"
if [  -n "$1" ]
then
    echo "downloading $1"
    cd $ROOT/javascripts/
    rm yui.js yui-min.js yui-debug.js
    wget "http://yui.yahooapis.com/$1/build/yui/yui-min.js"
    wget "http://yui.yahooapis.com/$1/build/yui/yui.js"
    wget "http://yui.yahooapis.com/$1/build/yui/yui-debug.js"
    cd ../..
else
    echo "run this with the version number, e.g. ./update_yui.sh 3.8.1"
fi
