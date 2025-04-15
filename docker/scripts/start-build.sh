#!/bin/bash

cat ./docker/conf/building.txt

npm i --no-fund --no-audit
npm start build
