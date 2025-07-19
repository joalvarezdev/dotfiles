jira::supp() {
  local assignee="joalvarez@infosis.tech"
  local label=""
  local component=""
  local story_points="1"
  local story_points_dev="1"
  local help_flag=false
  local parent=""

  if ! command -v jira &>/dev/null; then
    echo "El comando 'jira' no está instalado o no se encuentra en el PATH."
    return 1
  fi

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
    *)
      echo "Parámetro desconocido: $1"
      echo "Usa jira:supp --help para ver opciones"
      return 1
      ;;
    esac
  done

  local cmd=(
    "jira" "issue" "create"
    "-a" $assignee
    "--custom" "story-point-estimate=$story_points"
    "--custom" "story-points-desarrollo=$story_points_dev"
  )

  if [[ -n "$label" ]]; then
    cmd+=("-l" "$label")
  fi

  if [[ -n "$component" ]]; then
    cmd+=("-C" "$component")
  fi

  if [[ -n "$parent" ]]; then
    cmd+=("-P" "$parent")
  fi

  eval $cmd
}
