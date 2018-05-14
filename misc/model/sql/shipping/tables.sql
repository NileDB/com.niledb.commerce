CREATE SCHEMA IF NOT EXISTS "Shipping";
SET search_path TO "Shipping";

CREATE TABLE "Shipping"."Origin" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"address" int NOT NULL,
	"shippingZones" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Shipping"."Zone" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"country" int,
	"provinces" int[],
	"postalCodes" int NOT NULL,
	"shippingRates" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Shipping"."Rate" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"minimumOrderPrice" double precision,
	"maximumOrderPrice" double precision,
	"minimumOrderWeight" double precision,
	"maximumOrderWeight" double precision,
	"rate" double precision,
	"freeShippingRate" boolean NOT NULL,
	"disabled" boolean,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Shipping"."Package" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"type" "Shipping"."packageType",
	"conditionType" "Shipping"."packageConditionType",
	"dimensions" "Globals"."dimensionsType",
	"weight" "Globals"."weightType",
	"defaultPackageForShippingRates" boolean,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Orders"."Carrier" (
	"id" serial PRIMARY KEY, 
	"name" text NOT NULL
);

CREATE UNIQUE INDEX ON "Orders"."Carrier"("name");

CREATE TABLE "Orders"."CarrierAgent" (
	"id" serial PRIMARY KEY,
	"carrier" int NOT NULL,
	"username" text NOT NULL,
	"firstName" text NOT NULL,
	"lastName" text NOT NULL,
	"phone" text
);

CREATE UNIQUE INDEX ON "Orders"."CarrierAgent"("username");

CREATE TABLE "Orders"."CarrierAgentLocation" (
	"id" serial PRIMARY KEY,
	"carrierAgent" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now(),
	"location" point
);

CREATE UNIQUE INDEX ON "Orders"."CarrierAgentLocation"("carrierAgent", "timestamp");
