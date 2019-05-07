#!/usr/bin/env bash

# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -euo pipefail
log() { echo "$1" >&2; }

echo "Now deleting Cloud Run on GKE"

# set vars
export CLOUDRUN_CLUSTER_NAME=cloud-run-gke
export CLOUDRUN_ZONE=us-west1-a
export PROJECT=$(gcloud config get-value project)

# delete cluster
gcloud beta container clusters delete $CLOUDRUN_CLUSTER_NAME

# delete context
kubectx -d $CLOUDRUN_CLUSTER_NAME