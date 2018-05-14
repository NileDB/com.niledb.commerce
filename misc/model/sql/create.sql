-- Drop 
DROP TABLE IF EXISTS "Orders"."OrderStatus";
DROP TABLE IF EXISTS "Orders"."OrderPackage";
DROP TABLE IF EXISTS "Orders"."OrderLocation";
DROP TABLE IF EXISTS "Orders"."Order";
DROP TABLE IF EXISTS "Orders"."CarrierAgentLocation";
DROP TABLE IF EXISTS "Orders"."CarrierAgent";
DROP TABLE IF EXISTS "Orders"."Carrier";
DROP TABLE IF EXISTS "Orders"."Customer";

DROP FUNCTION IF EXISTS "Orders"."populateLocation";
DROP FUNCTION IF EXISTS "Orders"."populateOrderStatus";

DROP TYPE IF EXISTS "Orders"."orderStatus";
DROP TYPE IF EXISTS "Orders"."packageType";

DROP SCHEMA IF EXISTS "Orders";

SET search_path TO "public";

-- Schema Orders
CREATE SCHEMA IF NOT EXISTS "Orders";

SET search_path TO "Orders";

CREATE TYPE "Orders"."orderStatus" AS ENUM (
	'Cancelled', 
	'Delivered', 
	'InTransit', 
	'PaymentDue', 
	'PickupAvailable', 
	'Problem', 
	'Processing', 
	'Returned'
);

CREATE TYPE "Orders"."packageType" AS ENUM (
	'Regular', 
	'Refrigerated', 
	'Frozen'
);

CREATE TABLE "Orders"."Customer" (
	"id" serial PRIMARY KEY,
	"username" text NOT NULL,
	"email" text NOT NULL,
	"firstName" text NOT NULL,
	"lastName" text NOT NULL,
	"phone" text
);

CREATE UNIQUE INDEX ON "Orders"."Customer"("username");
CREATE UNIQUE INDEX ON "Orders"."Customer"("email");

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

ALTER TABLE "Orders"."CarrierAgent" ADD CONSTRAINT "carrier" FOREIGN KEY ("carrier") REFERENCES "Orders"."Carrier"("id");

CREATE TABLE "Orders"."CarrierAgentLocation" (
	"id" serial PRIMARY KEY,
	"carrierAgent" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now(),
	"location" point
);

CREATE UNIQUE INDEX ON "Orders"."CarrierAgentLocation"("carrierAgent", "timestamp");

ALTER TABLE "Orders"."CarrierAgentLocation" ADD CONSTRAINT "carrierAgent" FOREIGN KEY ("carrierAgent") REFERENCES "Orders"."CarrierAgent"("id");

CREATE TABLE "Orders"."Order" (
	"id" serial PRIMARY KEY,
	"customer" int NOT NULL,
	"orderId" text NOT NULL,
	"carrierAgent" int,
	"status" "orderStatus",
	"contactName" text,
	"contactPhone" text,
	"shippingAddress" text NOT NULL,
	"trackingId" text
);

CREATE UNIQUE INDEX ON "Orders"."Order"("orderId");

ALTER TABLE "Orders"."Order" ADD CONSTRAINT "customer" FOREIGN KEY ("customer") REFERENCES "Orders"."Customer"("id");
ALTER TABLE "Orders"."Order" ADD CONSTRAINT "carrierAgent" FOREIGN KEY ("carrierAgent") REFERENCES "Orders"."CarrierAgent"("id");

CREATE TABLE "Orders"."OrderLocation" (
	"id" serial PRIMARY KEY,
	"order" int NOT NULL,
	"carrierAgent" int,
	"timestamp" timestamp NOT NULL DEFAULT now(),
	"location" point
);

CREATE UNIQUE INDEX ON "Orders"."OrderLocation"("order", "carrierAgent", "timestamp");

ALTER TABLE "Orders"."OrderLocation" ADD CONSTRAINT "order" FOREIGN KEY ("order") REFERENCES "Orders"."Order"("id");
ALTER TABLE "Orders"."OrderLocation" ADD CONSTRAINT "carrierAgent" FOREIGN KEY ("carrierAgent") REFERENCES "Orders"."CarrierAgent"("id");

CREATE TABLE "Orders"."OrderPackage" (
	"id" serial PRIMARY KEY,
	"order" int NOT NULL,
	"packageNumber" int NOT NULL,
	"type" "Orders"."packageType" NOT NULL
);

CREATE UNIQUE INDEX ON "Orders"."OrderPackage"("order", "packageNumber");

ALTER TABLE "Orders"."OrderPackage" ADD CONSTRAINT "order" FOREIGN KEY ("order") REFERENCES "Orders"."Order"("id");

CREATE TABLE "Orders"."OrderStatus" (
	"id" serial PRIMARY KEY,
	"order" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now(),
	"status" "Orders"."orderStatus" NOT NULL
);

CREATE UNIQUE INDEX ON "Orders"."OrderStatus"("order", "timestamp");

ALTER TABLE "Orders"."OrderStatus" ADD CONSTRAINT "order" FOREIGN KEY ("order") REFERENCES "Orders"."Order"("id");

-- Triggers

CREATE OR REPLACE FUNCTION "Orders"."populateLocation"()
	RETURNS TRIGGER AS $populateLocation$
	DECLARE
		selectedOrder RECORD;
	BEGIN
		FOR selectedOrder IN SELECT "id" FROM "Orders"."Order" WHERE "carrierAgent" = NEW."carrierAgent" AND "status" = 'InTransit' LOOP
			INSERT INTO "Orders"."OrderLocation" ("order", "carrierAgent", "timestamp", "location") VALUES (selectedOrder."id", NEW."carrierAgent", NEW."timestamp", NEW."location");
		END LOOP;
		RETURN null;
	END;
	$populateLocation$ language 'plpgsql';

CREATE TRIGGER "populateLocation" 
	AFTER INSERT ON "Orders"."CarrierAgentLocation" 
	FOR EACH ROW 
	EXECUTE PROCEDURE "Orders"."populateLocation"();

CREATE OR REPLACE FUNCTION "Orders"."populateOrderStatus"()
	RETURNS TRIGGER AS $populateOrderStatus$
	BEGIN
		INSERT INTO "Orders"."OrderStatus" ("order", "status") VALUES (NEW."id", NEW."status");
		RETURN null;
	END;
	$populateOrderStatus$ language 'plpgsql';

CREATE TRIGGER "populateOrderStatus" 
	AFTER INSERT OR UPDATE OF "status" ON "Orders"."Order" 
	FOR EACH ROW 
	EXECUTE PROCEDURE "Orders"."populateOrderStatus"();
