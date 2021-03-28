#!/bin/sh
set -e

chef exec rspec ./samples/cookbooks/$1/
