CREATE SCHEMA IF NOT EXISTS "Products";
SET search_path TO "Products";

CREATE TABLE "Products"."Item" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"description" text,
	"salePrice" double precision,
	"originalPrice" double precision,
	"chargeTaxes" boolean NOT NULL DEFAULT true,
	"tax" int,
	"trackInventory" boolean NOT NULL DEFAULT true,
	"stock" int,
	"weight" "Globals"."weightType",
	"packageWeight" "Globals"."weightType",
	"dimensions" "Globals"."dimensionsType",
	"packageDimensions" "Globals"."dimensionsType",
	"fulfillmentService" "Products"."fulfillmentServiceType",
	"shippingRequired" boolean NOT NULL DEFAULT true,
	"downloadLink" text,
	"tags" text[],
	"seller" text,
	"collections" text,
	"seoTitle" text,
	"seoDescription" text,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."ItemImage" (
	"id" serial PRIMARY KEY,
	"item" int NOT NULL,
	"image" int NOT NULL,
	"isDefaultImage" boolean NOT NULL DEFAULT false,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."Variant" (
	"id" serial PRIMARY KEY,
	"item" int NOT NULL,
	"gtin13" text,
	"size" text,						-- Create custom types with attributes
	"color" text,						-- Create custom types with attributes
	"description" text,
	"salePrice" double precision,
	"originalPrice" double precision,
	"stock" int,
	"weight" "Globals"."weightType",
	"packageWeight" "Globals"."weightType",
	"dimensions" "Globals"."dimensionsType",
	"packageDimensions" "Globals"."dimensionsType",
	"tags" text[],
	"notifyOnLowStockLevel" int,
	"allowPurchaseWithoutStock" boolean NOT NULL DEFAULT false,
	"wssiEnabled" boolean NOT NULL DEFAULT false,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."VariantImage" (
	"id" serial PRIMARY KEY,
	"variant" int NOT NULL,
	"image" int NOT NULL,
	"isDefaultImage" boolean NOT NULL DEFAULT false,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."InventoryAdjustment" (
	"id" serial PRIMARY KEY,
	"variant" int NOT NULL,
	"adjustment" int NOT NULL,
	"reason" text,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."Collection" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"image" int,
	"tax" int,
	"type" "Products"."itemCollectionType",
	"condition" text,										-- It is like GraphQL where
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."CollectionItem" (
	"id" serial PRIMARY KEY,
	"collection" int NOT NULL,
	"item" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."Hierarchy" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"parent" int,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."HierarchyCollection" (
	"id" serial PRIMARY KEY,
	"hierarchy" int NOT NULL,
	"collection" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."Publication" (
	"id" serial PRIMARY KEY,
	"collection" int NOT NULL,
	"channels" "Channels"."saleChannelType"[],
	"publishedFrom" timestamp,
	"publishedUntil" timestamp,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."GiftCard" (
	"id" serial PRIMARY KEY,
	"code" text,				-- i.e. 33FA 883F 2A22 88FA
	"initialValue" double precision,
	"balance" double precision,
	"status" "Products"."giftCardStatusType",
	"issueDate" date,
	"comments" text,
	"expirationDate" date,
	"customer" int,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."Review" (
	"id" serial PRIMARY KEY,
	"item" int NOT NULL,
	"customer" int,
	"review" text,
	"rating" int NOT NULL,
	"orderLine" int,
	"timestamp" timestamp NOT NULL DEFAULT now()
);
