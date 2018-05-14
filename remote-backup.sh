#!/bin/bash
pg_dump -h tracking.niledb.com -U postgres -p 5433 --data-only niledb > niledb.sql
