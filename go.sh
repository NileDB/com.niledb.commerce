#!/bin/bash
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < sql/create.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < sql/insert.sql
./configure.sh

