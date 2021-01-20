#!/bin/sh

chef install ./samples/policies/$1/Policyfile.rb
chef export ./samples/policies/$1/Policyfile.rb ./artifacts/policies/$1/ --force
