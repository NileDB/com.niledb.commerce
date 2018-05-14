CREATE SCHEMA IF NOT EXISTS "Channels";
SET search_path TO "Channels";

CREATE TYPE "Channels"."saleChannelType" AS ENUM (
	'Online store',
	'Mobile App',
	'Point of sale (PoS)',
	'Instagram', 
	'Google Shopping', 
	'Amazon', 
	'Facebook', 
	'Buy Button', 
	'Pinterest', 
	'Houzz', 
	'Wanelo', 
	'Twitter', 
	'Shopkey', 
	'Chatbots', 
	'Messengers' 
);
