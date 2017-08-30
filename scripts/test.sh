#!/bin/bash
# activate virtual environment
. /appenv/bin/activate

# download requirements to build cache
pip download -d /build -r requirements_test.txt --no-input

# install application test requirements
pip install --no-index -f /build -r requirements_test.txt

# run test.sh arguments
exec $@

