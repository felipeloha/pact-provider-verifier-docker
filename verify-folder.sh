#!/bin/bash

echo "### verifying pacts ###"
rm -f pact.report || true
touch pact.report || true

for filename in $1/*.json; do
    pact-provider-verifier $filename --provider-base-url $2 --custom-provider-header "Authorization: Bearer $3" >> pact.report
done

echo "#### pacts verified ####"
cat pact.report


#usage: ./verify-folder.sh "pacts" "http://elixir-base:80" "sometoken"
