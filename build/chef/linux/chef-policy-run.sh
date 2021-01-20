#!/bin/sh

cd ./artifacts/policies/$1/
chef-client -z
