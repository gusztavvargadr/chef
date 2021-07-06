#!/bin/sh
set -e

chef exec cookstyle ./samples/cookbooks/$1/
