#!/bin/sh
set -e

curl -Ls https://omnitruck.chef.io/install.sh | bash -s -- -P chef -v 17.1.35
