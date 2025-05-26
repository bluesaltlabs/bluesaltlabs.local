# Mathesar

_Mathesar is a web application that makes working with PostgreSQL databases both simple and powerful. It empowers users of all technical skill levels to view, edit, query, and collaborate on data with a familiar spreadsheet-like interface—no code needed. It has native database-level access control, can be deployed in minutes, and works directly with PostgreSQL databases, schemas, and tables without extra abstractions. The project is 100% open source and maintained by Mathesar Foundation, a 501(c)(3) nonprofit._


---


```yml

#-------------------------------------------------------------------------------
# ADDITIONAL INFO ABOUT CONFIG VARIABLES
#
# SECRET_KEY:
#     Default: N/A
#     Info: A unique secret key required to be set by the user for Django's
#           security protection features. It should be 50 random characters. You
#           can read more about it here:
#           https://docs.djangoproject.com/en/4.2/ref/settings/#secret-key
#     Example: a_very_insecure_secret_key1*zobb123)k(_d1%wubkv6#
#
# DOMAIN_NAME:
#     Default: http://localhost
#     Info: Specifies the domains that can access Mathesar over http(port 80)
#           or https(port 443), also automatically creating SSL certificates
#           for the same. If you want to host an instance of Mathesar over the
#           internet or over your local network, add those domains here.
#     Example: yourdomain.com, *.subdomain.com, 127.0.0.1
#
# POSTGRES_DB:
#     Default: mathesar_django
#     Info: Specifies a name for the database that will be created and used by
#           Mathesar for managing internal data.
#     Example: zeus
#
# POSTGRES_USER:
#     Default: mathesar
#     Info: Specifies creation of a user with superuser privileges
#           and a database with the same name.
#     Example: athena
#
# POSTGRES_PASSWORD:
#     Default: mathesar
#     Info: Specifies the superuser password that is required to be set for the
#           PostgreSQL docker image.
#     Example: apollo
#
# POSTGRES_HOST:
#     Default: mathesar_db (name of the db service provided below)
#     Info: Specifies the host name on which portgres listen for connections
#           from client applications. Can be a docker compose service name,
#           a A TCP host address (e.g., host.docker.internal), or a Unix
#           socket path (e.g., /var/run/postgresql).
#     Example: kratos
#
# POSTGRES_PORT:
#     Default: 5432
#     Info: Specifies the port on which portgres listen for connections from
#           client applications.
#     Example: 5555
#
#-------------------------------------------------------------------------------
# INFO ABOUT VOLUMES
#
# Volumes are used by Mathesar to persist essential data.
#
# Running this compose file will automatically create a subdirectory named
# "msar" with the following file structure:
#
# msar_media/  (stores user uploaded datafiles(.csv/.tsv) to Mathesar)
# msar_pgdata/ (stores PostgreSQL data)
# msar_static/ (stores static files for Mathesar)
#
#-------------------------------------------------------------------------------
# MATHESAR SERVICES
#
# The next section defines various containers in a workable production setup.
#

```
