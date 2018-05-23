CREATE SCHEMA IF NOT EXISTS "Shipping";
SET search_path TO "Shipping";

CREATE TYPE "Shipping"."fulfillmentServiceType" AS ENUM (
	'Amazon',
	'Shipwire',
	'Rakuten'
);

CREATE TYPE "Shipping"."packageConditionType" AS ENUM (
	'Regular',
	'Refrigerated',
	'Frozen'
);

CREATE TYPE "Shipping"."packageType" AS ENUM (
	'Box',
	'Envelope',
	'SoftPackage',
	'CarrierSuppliedPackaging'
);

CREATE TYPE "Shipping"."shippingMethodType" AS ENUM (
	'Courier',
	'Download',
	'Store',
	'Repsol'
);
