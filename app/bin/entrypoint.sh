#!/bin/sh
#############################################################################
# Entry point for the Datasettes container.
#############################################################################
set -e
${HOME}/bin/post_compile

datasette serve dwh.db -h 0.0.0.0 -m metadata.yaml
