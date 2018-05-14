CREATE SCHEMA IF NOT EXISTS "Marketing";
SET search_path TO "Marketing";

CREATE TABLE "Marketing"."Discount" (
	"id" serial PRIMARY KEY,
	"codes" text[] NOT NULL,					-- Generate random codes
	"amount" double precision,
	"percent" double precision,
	"freeShipping" boolean NOT NULL DEFAULT false,
	"validFrom" timestamp,
	"validUntil" timestamp,
	"maximumNumberOfUses" int NOT NULL,
	"minimumAmount" double precision,
	"minimumQuantityOfItems" int,
	"limitOnePerCustomer" boolean NOT NULL DEFAULT false,
	"scope" "Marketing"."discountScopeType",
	"everyoneEligibility" boolean NOT NULL DEFAULT true,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Marketing"."DiscountUsage" (
	"id" serial PRIMARY KEY,
	"discount" int NOT NULL,
	"order" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Marketing"."DiscountItem" (
	"id" serial PRIMARY KEY,
	"discount" int NOT NULL,
	"item" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Marketing"."DiscountVariant" (
	"id" serial PRIMARY KEY,
	"discount" int NOT NULL,
	"variant" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Marketing"."DiscountCollection" (
	"id" serial PRIMARY KEY,
	"discount" int NOT NULL,
	"collection" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Marketing"."DiscountCustomer" (
	"id" serial PRIMARY KEY,
	"discount" int NOT NULL,
	"customer" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Marketing"."DiscountGroup" (
	"id" serial PRIMARY KEY,
	"discount" int NOT NULL,
	"group" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Marketing"."Campaign" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"message" text,				-- diferential values, offer, ...
	"target" text,
	"goals" text,
	"budget" double precision,
	"channels" "Channels"."saleChannelType"[],
	"impact" text,
	"timestamp" timestamp NOT NULL DEFAULT now()
);
