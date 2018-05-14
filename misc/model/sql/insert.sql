INSERT INTO "Orders"."Customer" ("username", "email", "firstName", "lastName") VALUES ('pacohernandezg', 'paco@hernandezgomez.com', 'Paco', 'Hernández Gómez');
INSERT INTO "Orders"."Customer" ("username", "email", "firstName", "lastName") VALUES ('albertomuñozc', 'alberto@gmail.com', 'Alberto', 'Muñoz Cabanillas');
INSERT INTO "Orders"."Customer" ("username", "email", "firstName", "lastName") VALUES ('fernandolopezm', 'fernando@gmail.com', 'Fernando', 'López Manzanares');

INSERT INTO "Orders"."Carrier" ("name") VALUES ('Correos Express');
INSERT INTO "Orders"."Carrier" ("name") VALUES ('DHL');
INSERT INTO "Orders"."Carrier" ("name") VALUES ('SEUR');

INSERT INTO "Orders"."CarrierAgent" ("carrier", "username", "firstName", "lastName") VALUES (1, 'perico', 'José', 'Fernández Rodríguez');
INSERT INTO "Orders"."CarrierAgent" ("carrier", "username", "firstName", "lastName") VALUES (1, 'juan', 'Juan', 'García Lenovo');
INSERT INTO "Orders"."CarrierAgent" ("carrier", "username", "firstName", "lastName") VALUES (1, 'teresa', 'Teresa', 'Ibáñez Serrador');

INSERT INTO "Orders"."CarrierAgent" ("carrier", "username", "firstName", "lastName") VALUES (2, 'marisa', 'Mª Isabel', 'Pascual Fernández');
INSERT INTO "Orders"."CarrierAgent" ("carrier", "username", "firstName", "lastName") VALUES (2, 'john', 'John', 'Smith');


INSERT INTO "Orders"."Order" ("customer", "orderId", "carrierAgent", "status", "contactName", "contactPhone", "shippingAddress", "trackingId")
	VALUES (1, '0000001', 1, 'InTransit', 'Paco', '+34615345435', 'Miguel Servet, 34', '123123');
	
INSERT INTO "Orders"."CarrierAgentLocation" ("carrierAgent", "location") VALUES (1, Point(20,40));
