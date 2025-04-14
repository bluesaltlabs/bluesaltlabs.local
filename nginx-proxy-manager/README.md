

The following was created in portainer:
1. Create volumes for `network proxy manager` stack:
  - proxy_manager_sql
  - proxy_manager_data
  - proxy_manager_ssl
2. Create the stack and add the contents of the `docker-compose.yml` file.
  - also add the `MYSQL_ROOT_PASSWORD` and `MYSQL_PASSWORD` environment variables with sane values.
  - save these values somewhere safe.
