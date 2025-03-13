#!/bin/bash

context=$(kubectl config current-context 2>/dev/null || echo "no-context")

if echo "$context" | grep -qi "prod"; then
    echo "#[bold,fg=red]$context#[default]"
else
    echo "#[fg=default]$context#[default]"
fi
