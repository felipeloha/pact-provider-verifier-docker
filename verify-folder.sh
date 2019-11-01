#!/bin/bash

echo "### verifying pacts ###"
rm -f pact.report || true
touch pact.report || true

for filename in $1/*.json; do
    pact-provider-verifier $filename $2 >> pact.report
done

echo "#### pacts verified ####"
cat pact.report


#usage: ./verify-folder.sh pacts "--provider-base-url http://elixir-base:80 --custom-provider-header \"Authorization: Bearer sometoken\""
