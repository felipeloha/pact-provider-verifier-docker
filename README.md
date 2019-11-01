# General
Added docker functionality to https://github.com/pact-foundation/pact-provider-verifier

# Create docker image
docker build -t pact-verifier .
docker run pact-verifier

# Copy pacts to container and bash in
docker cp pacts/test.json CONT_ID:/app
docker exec -it CONT_ID /bin/bash

# execute single pacts (inside container)
pact-provider-verifier test.json --provider-base-url https://someurl.com
pact-provider-verifier test-body.json --provider-base-url https://someurl.com --custom-provider-header "Authorization: Bearer ydnchdkry9YaqeiESgIGfSLzPW5fCK0q"

# execute all pacts in folder (inside container)
/verify-folder.sh pacts "--provider-base-url http://elixir-base:80 --custom-provider-header \"Authorization: Bearer ydnchdkry9YaqeiESgIGfSLzPW5fCK0q\""
