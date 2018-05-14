CREATE SCHEMA IF NOT EXISTS "Channels";
SET search_path TO "Channels";

CREATE TABLE "Channels"."Store" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"usernames" text[],
	"legalBusinessName" text,
	"address" "Globals"."addressType",
	"customerFacingEmail" text,
	"billingInfo" "Globals"."billingInfoType",
	"defaultCurrency" "Globals"."currencyType",
	"defaultWeightUnit" "Globals"."measureUnitType",
	"orderIdPrefix" text,
	"orderIdSuffix" text,
	"domain" text,
	"status" "Channels"."requiredStoreStatusDomain",
	"seoTitle" text,
	"seoDescription" text,
	"timezone" "Globals"."timeZoneType",
	"allTaxesIncluded" boolean NOT NULL DEFAULT true,							-- All taxes are included in prices
	"chargeDigitalGoodsTaxes" boolean NOT NULL DEFAULT false,
	"userAccountsRequired" "Globals"."userAccountsRequiredType",
	"multipleDiscountsDisabled" boolean NOT NULL DEFAULT false,
	"discountToApplyToAbandonedCarts" int,
	"giftCardsEnabled" boolean NOT NULL DEFAULT true,
	"inviteCustomersToCreateAccounts" boolean NOT NULL DEFAULT false,
	"refundTerms" text,
	"privacyTerms" text,
	"serviceTerms" text,
	"location" point,
	"timestamp" timestamp DEFAULT now()
);
