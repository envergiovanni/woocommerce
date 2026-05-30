FROM wordpress:php8.2-apache

# Copiar el script de inicio al contenedor
COPY entrypoint.sh /usr/local/bin/custom-entrypoint.sh

# Asegurar permisos de ejecución
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

# Definir el entrypoint
ENTRYPOINT ["/bin/bash", "/usr/local/bin/custom-entrypoint.sh"]
