#!/bin/bash
# Linear Project Mapper
# Maps Slack channels/project names to Linear workspaces
# Usage: source linear-project.sh <project-name>
#        linear_for <project> <command> [args...]

set -euo pipefail

BASE_DIR="$(dirname "$(readlink -f "$0")")"
SCRIPT="${BASE_DIR}/scripts/linear.sh"

# Project → Linear Workspace Mapping
declare -A LINEAR_TEAMS=(
    ["velvet-reads"]="VR"
    ["velvetreads"]="VR"
    ["pickster"]="PICKSTER"  # When available
    ["pickster-app"]="PICKSTER"
    ["polly"]="POLLY"  # When available
)

declare -A LINEAR_CHANNELS=(
    ["C0AEU780UA3"]="velvet-reads"  # #velvet-reads
    ["C0AF9LGKQGJ"]="pickster"      # #pickster
    ["C0AG07E534P"]="polly"         # #polly
)

# Resolve project name to Linear team key
resolve_team_key() {
    local project="$1"
    local team_key="${LINEAR_TEAMS[$project]:-}"
    
    if [[ -z "$team_key" ]]; then
        echo "Error: Unknown project '$project'" >&2
        echo "Known projects: ${!LINEAR_TEAMS[@]}" >&2
        return 1
    fi
    
    echo "$team_key"
}

# Resolve Slack channel ID to project name
resolve_project_from_channel() {
    local channel_id="$1"
    local project="${LINEAR_CHANNELS[$channel_id]:-}"
    
    if [[ -z "$project" ]]; then
        echo "Error: Unknown channel ID '$channel_id'" >&2
        return 1
    fi
    
    echo "$project"
}

# Run linear.sh command with project context
linear_for() {
    local project="$1"
    shift
    
    local team_key
    team_key=$(resolve_team_key "$project") || return 1
    
    export LINEAR_DEFAULT_TEAM="$team_key"
    "$SCRIPT" "$@"
}

# Get team key for a project
get_team_key() {
    local project="$1"
    resolve_team_key "$project"
}

# List all mapped projects
list_projects() {
    echo "Available projects:"
    for project in "${!LINEAR_TEAMS[@]}"; do
        team="${LINEAR_TEAMS[$project]}"
        echo "  $project → $team"
    done | sort
}

# If sourced with arguments, execute directly
if [[ ${#BASH_SOURCE[@]} -eq 1 ]] && [[ $# -gt 0 ]]; then
    case "$1" in
        projects)
            list_projects
            ;;
        team-key)
            get_team_key "$2"
            ;;
        *)
            linear_for "$@"
            ;;
    esac
fi
