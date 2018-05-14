CREATE SCHEMA IF NOT EXISTS "Shipping";
SET search_path TO "Shipping";

CREATE TABLE "Shipping"."Origin" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"address" "Globals"."addressType" NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Shipping"."Destination" (
	"id" serial PRIMARY KEY,
	"name" text,
	"country" int,
	"postalCodes" text[],
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Shipping"."DestinationProvince" (
	"id" serial PRIMARY KEY,
	"destination" int NOT NULL,
	"province" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Shipping"."Package" (
	"id" serial PRIMARY KEY,
	"name" text,
	"type" "Shipping"."packageType",
	"conditionType" "Shipping"."packageConditionType",
	"dimensions" "Globals"."dimensionsType",
	"weight" "Globals"."weightType",
	"defaultPackageForShippingRates" boolean NOT NULL DEFAULT false,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Shipping"."Rate" (
	"id" serial PRIMARY KEY,
	"name" text,
	"origin" int,
	"destination" int,
	"package" int,
	"minimumOrderPrice" double precision,
	"maximumOrderPrice" double precision,
	"minimumOrderWeight" double precision,
	"maximumOrderWeight" double precision,
	"rate" double precision,
	"freeShippingRate" boolean NOT NULL DEFAULT false,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Shipping"."Carrier" (
	"id" serial PRIMARY KEY, 
	"name" text NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX ON "Shipping"."Carrier"("name");

