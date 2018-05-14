CREATE SCHEMA IF NOT EXISTS "Marketing";
SET search_path TO "Marketing";

CREATE TABLE "Marketing"."Discount" (
	"id" serial PRIMARY KEY,
	"codes" text NOT NULL,					-- Generate random codes
	"amount" double precision NOT NULL,
	"percent" double precision NOT NULL,
	"freeShipping" boolean NOT NULL,
	"validFrom" timestamp NOT NULL,
	"validTo" timestamp NOT NULL,
	"maximumNumberOfUses" int NOT NULL,
	"minimumAmount" double precision NOT NULL,
	"minimumQuantityOfItems" int NOT NULL,
	"items" int NOT NULL,
	"itemVariants" int NOT NULL,
	"itemCollections" int NOT NULL,
	"limitOnePerCustomer" boolean NOT NULL,
	"scope" "Marketing"."discountScopeType" NOT NULL,
	"everyoneEligibility" boolean NOT NULL,
	"customersEligibility" int[] NOT NULL,
	"customerGroupsEligibility" int[] NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Marketing"."Campaign" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"message" text NOT NULL,				-- diferential values, offer, ...
	"target" text NOT NULL,
	"goals" text NOT NULL,
	"budget" double precision NOT NULL,
	"channel" "Channels"."saleChannelType" NOT NULL,
	"impact" text,
	"timestamp" timestamp NOT NULL DEFAULT now()
);
