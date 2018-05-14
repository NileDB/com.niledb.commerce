CREATE SCHEMA IF NOT EXISTS "Products";
SET search_path TO "Products";

CREATE TYPE "Products"."fulfillmentServiceType" AS ENUM (
	'Automatic',
	'Manual' 
);

CREATE TYPE "Products"."itemCollectionType" AS ENUM (
	'Automatic',
	'Manual' 
);

CREATE TYPE "Products"."giftCardStatusType" AS ENUM (
	'Disabled',
	'Enabled' 
);
