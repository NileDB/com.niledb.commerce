CREATE SCHEMA IF NOT EXISTS "Customers";
SET search_path TO "Customers";

CREATE TABLE "Customers"."Customer" (
	"id" serial PRIMARY KEY,
	"firstName" text NOT NULL,
	"lastName" text NOT NULL,
	"email" text NOT NULL,
	"phone" text NOT NULL,
	"acceptsMarketing" boolean NOT NULL,
	"taxExempt" boolean NOT NULL,
	"acceptsTracking" boolean NOT NULL,
	"location" int NOT NULL,
	"addresses" "Globals"."addressType" NOT NULL,
	"comments" text NOT NULL,
	"tags" text NOT NULL,
	"username" text NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Customers"."Group" (
	"id" serial PRIMARY KEY,
	"title" text NOT NULL,
	"condition" text NOT NULL,				-- It is like GraphQL where
	"customers" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Customers"."Timeline" (			-- Customer support
	"id" serial PRIMARY KEY,
	"customer" int NOT NULL,
	"topic" text NOT NULL,
	"message" text NOT NULL,
	"location" point,
	"timestamp" timestamp NOT NULL DEFAULT now()
);
