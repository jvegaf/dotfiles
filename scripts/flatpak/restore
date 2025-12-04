#!/usr/bin/env bash
# Restaura aplicaciones Flatpak desde flatpak_apps.txt (IDs uno por línea).
# Líneas vacías o que empiezan con # se ignoran.

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LIST_FILE="${SCRIPT_DIR}/flatpak_apps.txt"

REMOTE=""
DRY_RUN="false"

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN="true" ;;
    --help|-h)
      echo "Uso: $0 [remoto] [--dry-run]"
      echo "  remoto    (opcional) nombre del remoto (ej: flathub)"
      echo "  --dry-run  simula instalaciones"
      exit 0
      ;;
    *)
      # Primer argumento no-opción lo tomamos como remoto (si aún no asignado)
      [[ -z "$REMOTE" && "${arg#-}" = "$arg" ]] && REMOTE="$arg"
      ;;
  esac
done

if [[ ! -f "$LIST_FILE" ]]; then
  echo "No existe el fichero esperado: $LIST_FILE"
  exit 1
fi

echo "Fuente de IDs: $LIST_FILE"
[[ -n "$REMOTE" ]] && echo "Remoto forzado: $REMOTE"
[[ "$DRY_RUN" == "true" ]] && echo "Modo simulación (no instala)"

# Cache de instaladas (array)
mapfile -t INSTALLED < <(flatpak list --app --columns=application 2>/dev/null || true)

is_installed() {
  local id="$1"
  for i in "${INSTALLED[@]}"; do
    [[ "$i" == "$id" ]] && return 0
  done
  return 1
}

COUNT_TOTAL=0
COUNT_SKIP=0
COUNT_INSTALL=0
FAILED=()

while IFS= read -r line || [[ -n "$line" ]]; do
  id="${line%%#*}"
  id="$(echo "$id" | xargs || true)"
  [[ -z "$id" ]] && continue
  COUNT_TOTAL=$((COUNT_TOTAL+1))

  if is_installed "$id"; then
    echo "[=] Ya instalada: $id"
    COUNT_SKIP=$((COUNT_SKIP+1))
    continue
  fi

  echo "[+] Instalando: $id"
  if [[ "$DRY_RUN" == "true" ]]; then
    echo "    (dry-run) flatpak install -y ${REMOTE:+$REMOTE }$id"
    COUNT_INSTALL=$((COUNT_INSTALL+1))
    continue
  fi

  if flatpak install -y ${REMOTE:+"$REMOTE"} "$id"; then
    COUNT_INSTALL=$((COUNT_INSTALL+1))
    INSTALLED+=("$id")
  else
    echo "[!] Falló: $id"
    FAILED+=("$id")
  fi
done < "$LIST_FILE"

echo
echo "Resumen:"
echo "  Total en lista:      $COUNT_TOTAL"
echo "  Ya instaladas:       $COUNT_SKIP"
echo "  Instaladas nuevas:   $COUNT_INSTALL"
echo "  Fallidas:            ${#FAILED[@]}"

if (( ${#FAILED[@]} )); then
  echo "IDs fallidos:"
  for f in "${FAILED[@]}"; do echo "  $f"; done
  exit 2
fi
