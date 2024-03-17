#!/bin/bash

if [[ ! -f /tmp/env_dep.txt ]]; then
	export BW_SESSION="GVz+QVZ0ZQWohGVosWuK1PtZauRXusP4WQ3vGZTli8na7lYmnOQYchF7z/p/Z5yfpZUzQzwzzU7FjgM1Aa7iww=="
	bw get notes environments >/tmp/env_dep.txt
	bw get notes infosis >/tmp/env_infs.txt
fi

source /tmp/env_infs.txt
source /tmp/env_dep.txt
