ALTER TABLE "Customers"."Xxxxx" ADD CONSTRAINT "xxxXxx" FOREIGN KEY ("xxxXxx") REFERENCES "Customers"."Xxxxx"("id");

ALTER TABLE "Orders"."CarrierAgent" ADD CONSTRAINT "carrier" FOREIGN KEY ("carrier") REFERENCES "Orders"."Carrier"("id");
ALTER TABLE "Orders"."CarrierAgentLocation" ADD CONSTRAINT "carrierAgent" FOREIGN KEY ("carrierAgent") REFERENCES "Orders"."CarrierAgent"("id");
