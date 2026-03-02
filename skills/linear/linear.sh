#!/bin/bash
# Linear Unified CLI Wrapper
# Manages multi-workspace access with automatic authentication
# Usage: ./linear.sh [workspace] <command> [args...]

set -euo pipefail

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
AUTH_SCRIPT="${SCRIPT_DIR}/linear-auth.sh"

# Load auth system
source "$AUTH_SCRIPT"

# Default to current workspace (or velvetreads if not set)
WORKSPACE="${LINEAR_DEFAULT_WORKSPACE:-velvetreads}"

# Check if first argument is a workspace switch
if [[ $# -gt 0 ]] && [[ -n "${LINEAR_WORKSPACES[${1:-}]:-}" ]]; then
    WORKSPACE="$1"
    shift
fi

# If no command provided, show help
if [[ $# -eq 0 ]]; then
    cat << 'EOF'
Linear Unified CLI - Multi-Workspace Manager

Usage:
  ./linear.sh [workspace] <command> [args...]

Workspaces:
EOF
    list_workspaces
    echo ""
    echo "Commands (examples):"
    echo "  ./linear.sh velvetreads teams"
    echo "  ./linear.sh velvetreads projects"
    echo "  ./linear.sh pickster standup"
    echo ""
    echo "Switch workspace:"
    echo "  ./linear.sh use velvetreads"
    echo "  ./linear.sh use pickster"
    exit 0
fi

# Execute command in specified workspace
linear_in_workspace "$WORKSPACE" "$@"
