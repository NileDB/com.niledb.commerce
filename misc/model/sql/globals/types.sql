CREATE SCHEMA IF NOT EXISTS "Globals";
SET search_path TO "Globals";

CREATE DOMAIN "Globals"."requiredTextDomain" AS text NOT NULL;
CREATE DOMAIN "Globals"."requiredIntDomain" AS int NOT NULL;
CREATE DOMAIN "Globals"."requiredDoubleDomain" AS double precision NOT NULL;

CREATE TYPE "Globals"."measurePrefixType" AS ENUM (
	'da (deca)',
	'h (hecto)',
	'k (kilo)',
	'M (mega)',
	'G (giga)',
	'T (tera)',
	'P (peta)',
	'E (exa)',
	'Z (zetta)',
	'Y (yotta)',
	'd (deci)',
	'c (centi)',
	'm (milli)',
	'µ (micro)',
	'n (nano)',
	'p (pico)',
	'f (femto)',
	'a (atto)',
	'z (zepto)',
	'y (yocto)'
);

CREATE TYPE "Globals"."measureBaseUnitType" AS ENUM (
	'm (metre)',
	'g (gram)',
	's (second)',
	'minute',
	'hour',
	'day',
	'week',
	'month',
	'year',
	'century',
	'in (inch)',
	'ft (foot)',
	'yd (yard)',
	'mi (mile)',
	'nautical breaststroke',
	'nautical mile',
	'A (ampere)',
	'K (kelvin)',
	'mol (mole)',
	'cd (candela)',
	'rad (radian)',
	'sr (steradian)',
	'Hz (hertz)',
	'N (newton)',
	'Pa (pascal)',
	'J (joule)',
	'W (watt)',
	'C (coulomb)',
	'V (volt)',
	'F (farad)',
	'Ω (ohm)',
	'S (siemens)',
	'Wb (weber)',
	'T (tesla)',
	'H (henry)',
	'℃ (degree Celsius)',
	'lm (lumen)',
	'lx (lux)',
	'Bq (becquerel)',
	'Gy (gray)',
	'Sv (sievert)',
	'kat (katal)'
);

CREATE DOMAIN "Globals"."requiredMeasureBaseUnitDomain" AS "Globals"."measureBaseUnitType" NOT NULL;

CREATE TYPE "Globals"."measureUnitType" AS (
	"baseUnit" "Globals"."requiredMeasureBaseUnitDomain",
	"prefix" "Globals"."measurePrefixType",
	"multiplier" int
);

CREATE TYPE "Globals"."currencyType" AS ENUM (
	'USD',
	'EUR',
	'JPY',
	'GBP',
	'CHF',
	'CAD',
	'AUD',
	'NZD'
);

CREATE TYPE "Globals"."addressType" AS ( 
	"addressAlias" text,
	"addressLine1" "Globals"."requiredTextDomain",
	"addressLine2" text,
	"city" "Globals"."requiredTextDomain",
	"postalCode" text, 						-- zip/postal code
	"province" int,							-- state/province/region
	"country" int,
	"firstName" text,
	"lastName" text,
	"company" text,
	"phone" text,
	"email" text,
	"comments" text
);

CREATE TYPE "Globals"."weightType" AS (
	"weight" "Globals"."requiredDoubleDomain",
	"unit" "Globals"."measureUnitType"
);

CREATE TYPE "Globals"."dimensionsType" AS (
	"length" "Globals"."requiredDoubleDomain",
	"width" "Globals"."requiredDoubleDomain",
	"height" "Globals"."requiredDoubleDomain",
	"unit" "Globals"."measureUnitType"
);

CREATE TYPE "Globals"."userAccountsRequiredType" AS ENUM (
	'Disabled',
	'Optional',
	'Required' 
);
