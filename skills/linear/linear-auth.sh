#!/bin/bash
# Linear Multi-Workspace Authentication Manager
# Allows switching between Linear workspaces (Velvet Reads, Pickster, etc.)

set -u

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
ENV_FILE="${PROJECT_ROOT}/.env"

# Load environment variables
if [[ -f "$ENV_FILE" ]]; then
    set +a
    source "$ENV_FILE"
    set -a
fi

# Get API key for workspace
get_api_key() {
    local workspace="$1"
    
    case "$workspace" in
        velvetreads|velvet-reads)
            echo "${LINEAR_API_KEY_VELVETREADS:-}"
            ;;
        pickster|pickster-app)
            echo "${LINEAR_API_KEY_PICKSTER:-}"
            ;;
        *)
            echo ""
            ;;
    esac
}

# Get team key for workspace
get_team_key() {
    local workspace="$1"
    
    case "$workspace" in
        velvetreads|velvet-reads)
            echo "VR"
            ;;
        pickster|pickster-app)
            echo "PCK"
            ;;
        *)
            echo ""
            ;;
    esac
}

# Check if workspace is valid
is_valid_workspace() {
    local workspace="$1"
    case "$workspace" in
        velvetreads|velvet-reads|pickster|pickster-app)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# Switch to a workspace
linear_use() {
    local workspace="$1"
    
    # Validate workspace
    if ! is_valid_workspace "$workspace"; then
        echo "Error: Unknown workspace '$workspace'" >&2
        list_workspaces
        return 1
    fi
    
    # Get API key
    local api_key
    api_key=$(get_api_key "$workspace")
    
    if [[ -z "$api_key" ]]; then
        echo "Error: API key not configured for workspace '$workspace'" >&2
        return 1
    fi
    
    # Export for use
    export LINEAR_API_KEY="$api_key"
    export LINEAR_DEFAULT_WORKSPACE="$workspace"
    export LINEAR_DEFAULT_TEAM="$(get_team_key "$workspace")"
    
    echo "✅ Switched to workspace: $workspace"
    echo "   Team: ${LINEAR_DEFAULT_TEAM}"
}

# List available workspaces
list_workspaces() {
    echo "Available workspaces:"
    echo "  velvetreads (Team: VR)"
    echo "  pickster (Team: PCK)"
}

# Get current workspace
current_workspace() {
    echo "${LINEAR_DEFAULT_WORKSPACE:-velvetreads}"
}

# Run linear.sh command in a specific workspace
linear_in_workspace() {
    local workspace="$1"
    shift
    
    linear_use "$workspace" || return 1
    
    local script="${SCRIPT_DIR}/scripts/linear.sh"
    "$script" "$@"
}

# If called directly, handle commands
if [[ ${#BASH_SOURCE[@]} -eq 1 ]] && [[ $# -gt 0 ]]; then
    case "${1:-}" in
        list)
            list_workspaces
            ;;
        current)
            current_workspace
            ;;
        use)
            if [[ $# -lt 2 ]]; then
                echo "Usage: $0 use <workspace>" >&2
                return 1
            fi
            linear_use "$2"
            ;;
        *)
            echo "Unknown command: $1" >&2
            echo "Available commands: list, current, use <workspace>" >&2
            return 1
            ;;
    esac
fi
