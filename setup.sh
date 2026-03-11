#!/usr/bin/env sh
set -eu

EXPECTED_NODE_MAJOR="$(tr -d '[:space:]' < .nvmrc 2>/dev/null || true)"

fail() {
  echo "[setup] ERROR: $1" >&2
  exit 1
}

info() {
  echo "[setup] $1"
}

command -v node >/dev/null 2>&1 || fail "Node.js no está instalado. Instala Node $(cat .nvmrc 2>/dev/null || echo 'LTS') y vuelve a ejecutar la configuración."
command -v npm >/dev/null 2>&1 || fail "npm no está instalado o no está en PATH. Reinstala Node.js y vuelve a ejecutar la configuración."

NODE_VERSION="$(node -v | sed 's/^v//')"
NODE_MAJOR="$(echo "$NODE_VERSION" | cut -d. -f1)"

if [ -n "$EXPECTED_NODE_MAJOR" ] && [ "$NODE_MAJOR" != "$EXPECTED_NODE_MAJOR" ]; then
  fail "La versión mayor de Node no coincide. Se encontró v$NODE_VERSION, se esperaba v$EXPECTED_NODE_MAJOR (según .nvmrc)."
fi

info "Versión de Node: v$NODE_VERSION"
info "Versión de npm: $(npm -v)"

info "Instalando dependencias con npm ci..."
if ! npm ci; then
  fail "Falló la instalación de dependencias. Revisa la salida de npm para más detalles."
fi

if [ ! -f .env ]; then
  info "Creando .env desde .env.example"
  cp .env.example .env
else
  info ".env ya existe. Se omite la copia."
fi

info "Ejecutando migraciones (si existen)..."
if ! npm run migrate --if-present; then
  fail "Falló el paso de migración."
fi

info "Ejecutando seed (si existe)..."
if ! npm run seed --if-present; then
  fail "Falló el paso de seed."
fi

info "Configuración finalizada correctamente. Ejecuta 'npm run dev' para iniciar desarrollo local."
