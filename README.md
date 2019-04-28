docker-compose up -d
docker-compose exec postgresql bash
# root@bd4dad8a13d6:/# psql -U postgres
# psql (11.1 (Debian 11.1-1.pgdg90+1))
# Type "help" for help.
create database dbname;
create user user with encrypted password 'pass';
grant all privileges on database dbname to user;
exit;
cd /home
psql -U user dbname < import.sql # from import dir





docker-compose exec postgresql pg_dump -U postgres -w --dbname postgres > db.sql #import
docker-compose exec postgresql psql -U postgres -w -d postgres -f db.sql # export