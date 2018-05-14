CREATE SCHEMA IF NOT EXISTS "Channels";
SET search_path TO "Channels";

CREATE TABLE "Channels"."Store" (
	"id" serial PRIMARY KEY,
	"name" text NOT NULL,
	"adminUser" text NOT NULL,
	"legalBusinessName" text NOT NULL,
	"address" "Globals"."addressType" NOT NULL,
	"customerFacingEmail" text NOT NULL,
	"billingInfo" text NOT NULL,
	"defaultCurrency" "Globals"."currencyType" NOT NULL,
	"defaultWeightUnit" "Globals"."measureUnitType" NOT NULL,
	"orderIdPrefix" text NOT NULL,
	"orderIdSuffix" text NOT NULL,
	"staff" text NOT NULL,					-- user accounts, roles
	"domain" text NOT NULL,
	"status" text NOT NULL,
	"seoTitle" text NOT NULL,
	"seoDescription" text NOT NULL,
	"timezone" text NOT NULL,
	"enabledPaymentMethods" text NOT NULL,
	"allTaxesIncluded" boolean NOT NULL,	-- All taxes are included in prices
	"chargeDigitalGoodsTaxes" boolean NOT NULL,
	"userAccountsRequired" "Globals"."userAccountsRequiredType" NOT NULL,
	"multipleDiscountsDisabled" boolean NOT NULL,
	"applyAutomaticDiscountToAbandonedCarts" text NOT NULL,
	"giftCardsEnabled" boolean NOT NULL,
	"inviteCustomersToCreateAccounts" boolean NOT NULL,
	"refundTerms" text NOT NULL,
	"privacyTerms" text NOT NULL,
	"serviceTerms" text NOT NULL,
	"location" point,
	"timestamp" timestamp NOT NULL DEFAULT now()
);
