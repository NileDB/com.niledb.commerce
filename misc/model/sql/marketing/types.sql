CREATE SCHEMA IF NOT EXISTS "Marketing";
SET search_path TO "Marketing";

CREATE TYPE "Marketing"."discountScopeType" AS ENUM (
	'Apply to single item per order',
	'Apply to every applicable item in the cart'
);
