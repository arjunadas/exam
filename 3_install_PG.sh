# смотрим доступные версии:
apt-cache search postgresql

# видм, что доступен postgresql-12

# т.к. в задании не сказано какую версию ставить, то ставим ту, что доступна
apt-get install postgresql-12


#проверяем какие пользователи есть
sudo -u postgres psql -c "\du"

#                                   List of roles
# Role name |                         Attributes                         | Member of
#-----------+------------------------------------------------------------+-----------
# postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}


# add user
sudo -u postgres psql -c 'CREATE USER "user";' 

#проверяем
sudo -u postgres psql -c "\du"

#                                   List of roles
# Role name |                         Attributes                         | Member of
#-----------+------------------------------------------------------------+-----------
# postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
# user      |                                                            | {}

