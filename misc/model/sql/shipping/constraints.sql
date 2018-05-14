ALTER TABLE "Shipping"."Destination" ADD CONSTRAINT "country" FOREIGN KEY ("country") REFERENCES "Globals"."Country"("id");
ALTER TABLE "Shipping"."DestinationProvince" ADD CONSTRAINT "destination" FOREIGN KEY ("destination") REFERENCES "Shipping"."Destination"("id");
ALTER TABLE "Shipping"."DestinationProvince" ADD CONSTRAINT "province" FOREIGN KEY ("province") REFERENCES "Globals"."Province"("id");
ALTER TABLE "Shipping"."Rate" ADD CONSTRAINT "origin" FOREIGN KEY ("origin") REFERENCES "Shipping"."Origin"("id");
ALTER TABLE "Shipping"."Rate" ADD CONSTRAINT "destination" FOREIGN KEY ("destination") REFERENCES "Shipping"."Destination"("id");
ALTER TABLE "Shipping"."Rate" ADD CONSTRAINT "package" FOREIGN KEY ("package") REFERENCES "Shipping"."Package"("id");
