#!/usr/bin/env bash

set -euo pipefail

node() { nvm run default; }
export -f node

bazel build --local_ram_resources=4000 -c opt //tensorflow/tools/lib_package:libtensorflow

cp ./bazel-bin/tensorflow/tensorflow/tools/lib_package/*.tar.gz /tensorflow