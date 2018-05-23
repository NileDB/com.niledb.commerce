CREATE SCHEMA IF NOT EXISTS "Marketing";
SET search_path TO "Marketing";

CREATE TYPE "Marketing"."discountScopeType" AS ENUM (
	'ApplyToSingleItemPerOrder',
	'ApplyToEveryApplicableItemInTheCart'
);
