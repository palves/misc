#!/bin/bash

# SPDX-License-Identifier: GPL-3.0-or-later
# Author  : Pedro Alves (pedro@palves.net)

DIR=$(dirname -- "$0")

powershell -ExecutionPolicy Bypass "$DIR/find-stale-gdbs.ps1" "$@"
