CREATE SCHEMA IF NOT EXISTS "Globals";
SET search_path TO "Globals";

CREATE TABLE "Globals"."Country" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX ON "Globals"."Country"("name");

CREATE TABLE "Globals"."Province" (
	"id" serial PRIMARY KEY,
	"country" int NOT NULL,
	"name" text NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX ON "Globals"."Province"("country", "name");

CREATE TABLE "Globals"."Image" (
	"id" serial PRIMARY KEY,
	"name" text,
	"image" bytea NOT NULL,
	"labels" text[],
	"addWatermark" boolean NOT NULL DEFAULT false,
	"mimeType" text,
	"timestamp" timestamp NOT NULL DEFAULT now()
);
