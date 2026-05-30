#!/bin/bash
set -e

# 1. Deshabilitar los módulos MPM que causan el conflicto
echo "Configurando módulos Apache MPM..."
a2dismod mpm_event 2>/dev/null || true
a2dismod mpm_worker 2>/dev/null || true

# 2. Habilitar explícitamente el módulo mpm_prefork (el requerido por PHP/WordPress)
a2enmod mpm_prefork 2>/dev/null || true

# 3. Ejecutar el entrypoint original de la imagen de WordPress
# Esto asegura que se copien los archivos y se configure la base de datos normalmente.
echo "Iniciando WordPress..."
exec docker-entrypoint.sh apache2-foreground