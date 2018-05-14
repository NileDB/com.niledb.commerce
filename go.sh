#!/bin/bash
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/channels/types.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/customers/types.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/globals/types.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/marketing/types.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/orders/types.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/products/types.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/sellers/types.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/shipping/types.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/channels/tables.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/customers/tables.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/globals/tables.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/marketing/tables.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/orders/tables.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/products/tables.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/sellers/tables.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/shipping/tables.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/channels/constraints.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/customers/constraints.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/globals/constraints.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/marketing/constraints.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/orders/constraints.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/products/constraints.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/sellers/constraints.sql
PGPASSWORD=postgres psql -h localhost -U postgres -p 5433 niledb < misc/model/sql/shipping/constraints.sql
./configure.sh
