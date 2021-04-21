#!/bin/bash

_SRC_REPO_URL=$1
_BRANCH=$2

git clone -b $_BRANCH $_SRC_REPO_URL src

