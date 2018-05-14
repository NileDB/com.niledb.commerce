CREATE SCHEMA IF NOT EXISTS "Orders";
SET search_path TO "Orders";

CREATE TYPE "Orders"."financialStatusType" AS ENUM (
	'Pending',
	'Paid',
	'Authorized',
	'Refunded' 
);

CREATE TYPE "Orders"."paymentMethodType" AS ENUM (
	'Cash',
	'Gift card',
	'Store credit',
	'External credit',
	'External debit',
	'Bank transfer'
);

CREATE TYPE "Orders"."cardType" AS ENUM (
	'Visa',
	'Mastercard',
	'American Express',
	'Discover'
);

CREATE TYPE "Orders"."paymentStatusType" AS ENUM (
	'Authorization',
	'Capture',
	'Clearing',
	'Funding'
);

CREATE TYPE "Orders"."fulfillmentStatusType" AS ENUM (
	'Cancelled', 
	'Delivered', 
	'InTransit', 
	'PaymentDue', 
	'PickupAvailable', 
	'Problem', 
	'Processing', 
	'Returned'
);
