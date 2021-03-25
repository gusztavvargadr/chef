#!/bin/sh
set -e

cd ./artifacts/policies/$1/
chef-client -z
