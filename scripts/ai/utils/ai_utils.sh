#!/usr/bin/env bash
set -euo pipefail

copilot_commit() {
  if ! command -v gh &>/dev/null; then
    echo "❌ GitHub CLI (gh) no está instalado."
    return 1
  fi

  if ! gh copilot suggest -h &>/dev/null; then
    echo "❌ GitHub Copilot CLI no está disponible o no tienes acceso."
    return 1
  fi

  local DIFF
  DIFF=$(git diff --cached)
  if [[ -z "$DIFF" ]]; then
    echo "❌ No hay cambios stageados."
    return 1
  fi

  local PROMPT="Escribe un mensaje de commit en formato Conventional Commits basado en este diff de git:

$DIFF"

  echo "⌛ Pidiendo sugerencia a Copilot..."
  local MESSAGE
  MESSAGE=$(printf "%s" "$PROMPT" | gh copilot suggest -t shell | tail -n +2 | sed '/^[[:space:]]*$/d')

  if [[ -z "$MESSAGE" ]]; then
    echo "❌ Copilot no devolvió ningún mensaje."
    return 1
  fi

  printf "\n💬 Mensaje sugerido por Copilot:\n%s\n" "$MESSAGE"

  read -r -p $'\n¿Quieres usar este mensaje? (y/N): ' CONFIRM
  if [[ "$CONFIRM" == "y" || "$CONFIRM" == "Y" ]]; then
    git commit -m "$MESSAGE"
  else
    echo "❌ Commit cancelado."
  fi
}

