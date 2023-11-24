#!/usr/bin/env bash

set -euo pipefail

apt update && apt install -y npm

pip install numpy wheel packaging requests opt_einsum
pip install keras_preprocessing --no-deps

npm install -g --verbose @bazel/bazelisk