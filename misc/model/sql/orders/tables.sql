CREATE SCHEMA IF NOT EXISTS "Orders";
SET search_path TO "Orders";

CREATE TABLE "Orders"."Order" (
	"id" serial PRIMARY KEY,
	"orderNumber" text NOT NULL,
	"customer" int,
	"date" timestamp NOT NULL,
	"billingAddress" "Globals"."addressType",
	"financialStatus" "Orders"."financialStatusType",
	"paymentStatus" "Orders"."paymentStatusType",
	"paymentDate" date,
	"fulfillmentStatus" "Orders"."fulfillmentStatusType",
	"fulfillmentDate" date,
	"currency" "Globals"."currencyType",
	"subtotal" double precision,
	"shippingCost" double precision,
	"total" double precision,
	"discountCodes" text[],
	"discountAmount" double precision,
	"shippingMethod" "Shipping"."shippingMethodType",
	"tags" text[],
	"draftOrder" boolean NOT NULL DEFAULT false,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Orders"."Timeline" (
	"id" serial PRIMARY KEY,
	"order" int NOT NULL,
	"topic" text,
	"message" text NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Orders"."OrderLine" (
	"id" serial PRIMARY KEY,
	"lineNumber" int NOT NULL,
	"itemName" text,
	"salePrice" text,
	"originalPrice" text,
	"sku" text,
	"quantity" int,
	"shippingRequired" boolean NOT NULL DEFAULT true,
	"taxable" boolean NOT NULL DEFAULT true,
	"fulfillmentStatus" "Orders"."fulfillmentStatusType",
	"comments" text,
	"cancellationDate" date,
	"outstandingBalance" double precision,
	"employeeUsername" text,
	"variant" int,
	"tags" text[],
	"sourceChannel" "Channels"."saleChannelType",
	"discount" double precision,
	"tax" int,
	"taxValue" double precision,
	"package" int,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Orders"."Tax" (
	"id" serial PRIMARY KEY,
	"name" text,
	"country" int,
	"postalCodes" text[],
	"taxRate" double precision NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Orders"."TaxProvince" (
	"id" serial PRIMARY KEY,
	"tax" int NOT NULL,
	"province" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Orders"."Package" (
	"id" serial PRIMARY KEY,
	"order" int NOT NULL,
	"type" int,
	"shippingAddress" "Globals"."addressType",
	"carrier" int,
	"trackingNumber" text,
	"notifyCustomerOfShipment" boolean NOT NULL DEFAULT false,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Orders"."Payment" (
	"id" serial PRIMARY KEY,
	"order" int NOT NULL,
	"paymentMethod" "Orders"."paymentMethodType",
	"paymentReference" text NOT NULL,
	"amount" double precision NOT NULL,
	"refundedAmount" double precision,
	"giftCard" int,
	"timestamp" timestamp NOT NULL DEFAULT now()
);
