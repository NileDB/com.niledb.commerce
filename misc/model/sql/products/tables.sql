CREATE SCHEMA IF NOT EXISTS "Products";
SET search_path TO "Products";

CREATE TABLE "Products"."Item" (
	"id" serial PRIMARY KEY,
	"title" text NOT NULL,
	"description" text NOT NULL,
	"salePrice" money NOT NULL,
	"originalPrice" money NOT NULL,
	"chargeTaxes" boolean NOT NULL,
	"tax" int NOT NULL,
	"trackInventory" boolean NOT NULL,
	"inventory" int NOT NULL,
	"images" text NOT NULL,
	"weight" text NOT NULL,
	"fulfillmentService" "Products"."fulfillmentServiceType",
	"shippingRequired" boolean NOT NULL,
	"downloadLink" text,
	"tags" text NOT NULL,
	"seller" text NOT NULL,
	"collections" text NOT NULL,
	"seoTitle" text NOT NULL,
	"seoDescription" text NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."ItemVariant" (
	"id" serial PRIMARY KEY,
	"item" int NOT NULL,
	"size" text NOT NULL,						-- Create custom types with attributes
	"color" text NOT NULL,						-- Create custom types with attributes
	"style" text NOT NULL,						-- Create custom types with attributes
	"weight" text NOT NULL,						-- Create custom types with attributes
	"finish" text NOT NULL,						-- Create custom types with attributes
	"material" text NOT NULL,						-- Create custom types with attributes
	"sku" text NOT NULL,
	"barcode" text NOT NULL,
	"salePrice" text NOT NULL,
	"originalPrice" text NOT NULL,
	"inventory" text NOT NULL,
	"tags" text NOT NULL,
	"notifyOnLowStockLevel" int NOT NULL,
	"allowPurchaseWithoutStock" text NOT NULL,
	"wssiEnabled" boolean NOT NULL,
	"location" point,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."ItemImage" (				-- Casi mejor reutilizar las imágenes
	"id" serial PRIMARY KEY,
	"title" text NOT NULL,
	"image" text NOT NULL,
	"addWatermark" boolean NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."InventoryAdjustment" (
	"id" serial PRIMARY KEY,
	"variant" int NOT NULL,
	"adjustment" int NOT NULL,
	"event" text NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."ItemCollection" (
	"id" serial PRIMARY KEY,
	"title" text NOT NULL,
	"image" text NOT NULL,
	"type" "Products"."itemCollectionType" NOT NULL,
	"condition" text NOT NULL,				-- It is like GraphQL where
	"items" text NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."CollectionPublication" (
	"id" serial PRIMARY KEY,
	"itemCollection" int NOT NULL,
	"channels" int NOT NULL,
	"date" date NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Products"."GiftCard" (
	"id" serial PRIMARY KEY,
	"code" text NOT NULL,				-- i.e. 33FA 883F 2A22 88FA
	"initialValue" double precision NOT NULL,
	"balance" double precision NOT NULL,
	"orders" int NOT NULL,
	"status" "Products"."giftCardStatusType" NOT NULL,
	"issueDate" date NOT NULL,
	"comments" text NOT NULL,
	"expirationDate" date NOT NULL,
	"customer" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);
