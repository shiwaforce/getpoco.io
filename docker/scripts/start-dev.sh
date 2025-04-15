#!/bin/bash

cat ./docker/conf/start.txt

npm i --no-fund --no-audit
npm start start
