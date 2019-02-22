#!/bin/bash
/usr/bin/pg_ctlcluster 9.5 main start
psql -U postgres -c "CREATE USER explain WITH PASSWORD 'explain';"
psql -U postgres -c 'CREATE DATABASE explain OWNER explain;'
psql -U explain -d explain -a -f /explain/sql/create.sql
psql -U explain -d explain -a -f /explain/sql/patch-001.sql
psql -U explain -d explain -a -f /explain/sql/patch-002.sql
psql -U explain -d explain -a -f /explain/sql/patch-003.sql
psql -U explain -d explain -a -f /explain/sql/patch-004.sql
psql -U explain -d explain -a -f /explain/sql/patch-005.sql
psql -U explain -d explain -a -f /explain/sql/patch-006.sql
psql -U explain -d explain -a -f /explain/sql/patch-007.sql
psql -U explain -d explain -a -f /explain/sql/patch-008.sql
psql -U explain -d explain -a -f /explain/sql/patch-009.sql
psql -U explain -d explain -a -f /explain/sql/patch-010.sql
psql -U explain -d explain -c 'GRANT ALL ON plans, users TO explain;'
/explain/explain.pl daemon
