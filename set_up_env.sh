#!/bin/bash

if [ -f /.dockerenv ]; then
    echo "Running inside a Docker container"
    apt update
    apt install python3-venv -y
    python3 -m venv ~/myros2env --system-site-packages
    source ~/myros2env/bin/activate
    pip install -r requirements.txt
    
else
    echo "Not inside Docker"
    python3 -m venv myenv
    source myenv/bin/activate
    pip install -r requirements.txt
fi