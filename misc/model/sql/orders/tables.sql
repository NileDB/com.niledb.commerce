CREATE SCHEMA IF NOT EXISTS "Orders";
SET search_path TO "Orders";

CREATE TABLE "Orders"."Order" (
	"id" serial PRIMARY KEY,
	"orderNumber" text NOT NULL,
	"customer" int NOT NULL,
	"financialStatus" "Orders"."financialStatusType" NOT NULL,
	"paymentStatus" "Orders"."paymentStatusType" NOT NULL,
	"paymentDate" date NOT NULL,
	"fulfillmentStatus" "Orders"."fulfillmentStatusType" NOT NULL,
	"fulfillmentDate" date NOT NULL,
	"currency" int NOT NULL,
	"subtotal" double precision NOT NULL,
	"shippingCost" double precision NOT NULL,
	"total" double precision NOT NULL,
	"discountCode" text NOT NULL,
	"discountAmount" double precision NOT NULL,
	"shippingMethod" "Shipping"."shippingMethodType" NOT NULL,
	"comments" text NOT NULL,
	"tags" text NOT NULL,
	"draftOrder" boolean NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Orders"."OrderLine" (
	"id" serial PRIMARY KEY,
	"lineNumber" int NOT NULL,
	"title" text NOT NULL,
	"salePrice" text NOT NULL,
	"originalPrice" text NOT NULL,
	"sku" text NOT NULL,
	"shippingRequired" boolean NOT NULL,
	"taxable" boolean NOT NULL,
	"fulfillmentStatus" "Orders"."fulfillmentStatusType" NOT NULL,
	"billingName" text NOT NULL,
	"billingCompany" text NOT NULL,
	"billingAddress" "Globals"."addressType" NOT NULL,
	"shippingName" text NOT NULL,
	"shippingCompany" text NOT NULL,
	"shippingAddress" "Globals"."addressType" NOT NULL,
	"comments" text NOT NULL,
	"cancellationDate" date NOT NULL,
	"paymentMethod" "Orders"."paymentMethodType" NOT NULL,
	"paymentReference" text NOT NULL,
	"refundedAmount" double precision NOT NULL,
	"seller" int NOT NULL,
	"outstandingBalance" double precision NOT NULL,
	"posEmployee" int NOT NULL,
	"posStore" int NOT NULL,
	"posTerminal" int NOT NULL,
	"itemVariant" int NOT NULL,
	"tags" text NOT NULL,
	"sourceChannel" "Channels"."saleChannelType" NOT NULL,
	"discount" double precision NOT NULL,
	"tax" int NOT NULL,
	"taxValue" double precision NOT NULL,
	"package" int NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Orders"."Tax" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"country" int NOT NULL,
	"provinces" text NOT NULL,
	"postalCodes" text NOT NULL,
	"taxRate" double precision NOT NULL,
	"collections" text NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);

CREATE TABLE "Orders"."Package" (
	"id" serial PRIMARY KEY,
	"type" int NOT NULL,
	"shippingCarrier" int NOT NULL,
	"trackingNumber" text NOT NULL,
	"notifyCustomerOfShipment" boolean NOT NULL,
	"timestamp" timestamp NOT NULL DEFAULT now()
);
