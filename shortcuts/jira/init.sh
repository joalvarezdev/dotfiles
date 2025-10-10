#!/usr/bin/env zsh

function shortcuts::jira::templates {
  template="chore"
  case $1 in
  "chore")
    path_template="$DOTFILES/templates/work/chore.md"
    ;;
  *)
    path_template="$DOTFILES/templates/work/chore.md"
    ;;
  esac

  echo "$path_template"
}

function jira::issue {
  local assignee="joalvarez@infosis.tech"
  local label=""
  local component=""
  local story_points="1"
  local story_points_dev="1"
  local help_flag=false
  local parent=""
  local template=""

  if ! command -v jira &>/dev/null; then
    echo "El comando 'jira' no está instalado o no se encuentra en el PATH."
    return 1
  fi

  local cmd=(
    "jira" "issue" "create"
  )

  while [[ $# -gt 0 ]]; do
    case $1 in
    -a | --assignee)
      if [[ -z "$2" || "$2" =~ ^- ]]; then
        echo "error: --assignee requiere un valor"
        return 1
      fi
      assignee="$2"
      shift 2
      ;;
    -l | --label)
      if [[ -z "$2" || "$2" =~ ^- ]]; then
        echo "error: --label requiere un valor"
        return 1
      fi
      label="$2"
      shift 2
      ;;
    -c | --component)
      if [[ -z "$2" || "$2" =~ ^- ]]; then
        echo "error: --component requiere un valor"
        return 1
      fi
      component="$2"
      shift 2
      ;;
    -sp | --story-points)
      if [[ -z "$2" || "$2" =~ ^- ]]; then
        echo "error: --story-points requiere un valor"
        return 1
      fi
      story_points="$2"
      shift 2
      ;;
    -spd | --story-points-dev)
      if [[ -z "$2" || "$2" =~ ^- ]]; then
        echo "error: --story-points-dev requiere un valor"
        return 1
      fi
      story_points_dev="$2"
      shift 2
      ;;
    -p | --parent)
      if [[ -z "$2" || "$2" =~ ^- ]]; then
        echo "error: --parrent requiere un valor"
        return 1
      fi
      parent="$2"
      shift 2
      ;;
    -t | --template)
      if [[ -z "$2" || "$2" =~ ^- ]]; then
        echo "error: --template require un valor"
        return 1
      fi
      template="$(shortcuts::jira::templates $2)"
      shift 2
      ;;
    *)
      echo "Parámetro desconocido: $1"
      echo "Usa jira:supp --help para ver opciones"
      return 1
      ;;
    esac

    if [[ -n "$label" ]]; then
      cmd+=("-l" "$label")
    fi

    if [[ -n "$component" ]]; then
      cmd+=("-C" "$component")
    fi

    if [[ -n "$parent" ]]; then
      cmd+=("-P" "$parent")
    fi

    if [[ -n "$template" ]]; then
      cmd+=("--template" "$template")
    fi

    cmd+=("--custom" "story-point-estimate=$story_points")
    cmd+=("--custom" "story-points-desarrollo=$story_points_dev")

  done

  cmd+=("-a" $assignee)

  eval $cmd
}

function jira::workload () {
  local issue="$1"
  local time_spent="$2"
  local comment="$3"

  if [ -z "$issue" ] || [ -z "$time_spent" ]; then
    echo "use: jira::workload PROJECT-123 '2h' 'optional comment'"
    return 1
  fi

  if [ -n "$comment" ]; then
    jira issue worklog add "$issue" "$time_spent" "$comment"
  else
    jira issue worklog add "$issue" "$time_spent"
  fi
}

function jira::status () {
  local issue="$1"
  local target_status="$2"

  if [ -z "$issue" ] || [ -z "$target_status" ]; then
    echo "use: jira::status PROJECT-123 'To Approved' "
    return 1
  fi

  local states=("To Do" "Do Today" "In Progress" "Approved")

  local current_status=$(jira issue view "$issue" | sed -n 's/.*🚧 \(.*\) ⌛.*/\1/p' | xargs)

  if [ -z "$current_status" ]; then
    echo "❌ Estado actual requerido"
    return 1
  fi

  local current_index=-1
  local target_index=-1
  local i=1

  for state in "${states[@]}"; do
    if [ "$state" = "$current_status" ]; then
      current_index=$i
    fi
    if [ "$state" = "$target_status" ]; then
      target_index=$i
    fi
    i=$((i + 1))
  done

  local j
  for ((j=current_index+1; j<=target_index; j++)); do
    local next_state="${states[$j]}"
    
    local api_state="To $next_state"

    if ! jira issue move "$issue" "$api_state"; then
      echo "❌ Error al mover a '$api_state'"
      return 1
    fi
    
    sleep 0.5
  done

}

function jira::edit () {
  local issue="$1"

  if [ -z "$issue" ]; then
    echo "use: jira::edit PROJECT-123"
    return 1
  fi

  jira issue edit "$issue"
}

function jira::list () {
  local user=$(jira me)
  local current_status=""
  local label=""

  local cmd=(
    "jira" "issue" "list"
  )

  while [[ $# -gt 0 ]]; do
    case $1 in
    -s | --status)
      if [[ -z "$2" || "$2" =~ ^- ]]; then
        echo "error: --status requiere un valor"
        return 1
      fi
      current_status="$2"
      shift 2
      ;;
    -l | --label)
      if [[ -z "$2" || "$2" =~ ^- ]]; then
        echo "error: --label requiere un valor"
        return 1
      fi
      label="$2"
      shift 2
      ;;
    esac

    if [[ -n "$current_status" ]]; then
      cmd+=("--status" '$current_status')
    fi

    if [[ -n "$label" ]]; then
      cmd+=("--label" "$label")
    fi

  done

  cmd+=("-a$user")

  echo $cmd

  eval $cmd
}
