#!/bin/bash

chef install ./samples/policies/$1/$2/Policyfile.rb
chef export ./samples/policies/$1/$2/Policyfile.rb ./.chef/policies/$1/$2 --force
