CREATE SCHEMA IF NOT EXISTS "Channels";
SET search_path TO "Channels";

CREATE TYPE "Channels"."saleChannelType" AS ENUM (
	'OnlineStore',
	'MobileApp',
	'PointOfSale',
	'Instagram',
	'GoogleShopping',
	'Amazon',
	'Facebook',
	'BuyButton',
	'Pinterest',
	'Houzz',
	'Wanelo',
	'Twitter',
	'Shopkey',
	'Chatbots',
	'Messengers'
);

CREATE TYPE "Channels"."storeStatusType" AS ENUM (
	'Disabled',
	'Enabled',
	'Maintenance'
);

CREATE DOMAIN "Channels"."requiredStoreStatusDomain" "Channels"."storeStatusType" NOT NULL;