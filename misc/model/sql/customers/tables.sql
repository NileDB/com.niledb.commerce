CREATE SCHEMA IF NOT EXISTS "Customers";
SET search_path TO "Customers";

CREATE TABLE "Customers"."Customer" (
	"id" serial PRIMARY KEY,
	"username" text NOT NULL,
	"firstName" text NOT NULL,
	"lastName" text,
	"email" text NOT NULL,
	"phone" text,
	"birthDate" date,
	"gender" "Globals"."genderType",
	"acceptsMarketing" boolean NOT NULL DEFAULT false,
	"taxExempt" boolean NOT NULL DEFAULT false,
	"acceptsTracking" boolean NOT NULL DEFAULT false,
	"addresses" "Globals"."addressType"[],
	"tags" text[],
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Customers"."Group" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"condition" text,				-- It is like GraphQL where
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Customers"."Timeline" (
	"id" serial PRIMARY KEY,
	"customer" int NOT NULL,
	"topic" text,
	"message" text NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Customers"."GroupCustomer" (
	"id" serial PRIMARY KEY,
	"group" "Customers"."Group" NOT NULL,
	"customer" "Customers"."Customer" NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Customers"."Recommendation" (
	"id" serial PRIMARY KEY,
	"customer" int NOT NULL,
	"item" int NOT NULL,
	"recommendationDate" date NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);
