SHELL := /bin/sh

.PHONY: setup install bootstrap-env migrate seed dev start test

setup: install bootstrap-env migrate seed
	@echo "Configuración completada. Inicia la app con 'npm run dev' o 'npm start'."

install:
	@echo "Instalando dependencias..."
	npm ci

bootstrap-env:
	@if [ ! -f .env ]; then \
		echo "Creando .env desde .env.example..."; \
		cp .env.example .env; \
	else \
		echo ".env ya existe. Se omite la copia."; \
	fi

migrate:
	@echo "Ejecutando migraciones (si existen)..."
	npm run migrate --if-present

seed:
	@echo "Ejecutando seed de datos (si existe)..."
	npm run seed --if-present

dev:
	npm run dev

start:
	npm start

test:
	npm test
