ALTER TABLE "Orders"."Order" ADD CONSTRAINT "customer" FOREIGN KEY ("customer") REFERENCES "Customers"."Customer"("id");
ALTER TABLE "Orders"."Timeline" ADD CONSTRAINT "order" FOREIGN KEY ("order") REFERENCES "Orders"."Order"("id");
ALTER TABLE "Orders"."OrderLine" ADD CONSTRAINT "variant" FOREIGN KEY ("variant") REFERENCES "Products"."Variant"("id");
ALTER TABLE "Orders"."OrderLine" ADD CONSTRAINT "tax" FOREIGN KEY ("tax") REFERENCES "Orders"."Tax"("id");
ALTER TABLE "Orders"."OrderLine" ADD CONSTRAINT "package" FOREIGN KEY ("package") REFERENCES "Orders"."Package"("id");
ALTER TABLE "Orders"."Tax" ADD CONSTRAINT "country" FOREIGN KEY ("country") REFERENCES "Globals"."Country"("id");
ALTER TABLE "Orders"."TaxProvince" ADD CONSTRAINT "tax" FOREIGN KEY ("tax") REFERENCES "Orders"."Tax"("id");
ALTER TABLE "Orders"."TaxProvince" ADD CONSTRAINT "province" FOREIGN KEY ("province") REFERENCES "Globals"."Province"("id");
ALTER TABLE "Orders"."Package" ADD CONSTRAINT "order" FOREIGN KEY ("order") REFERENCES "Orders"."Order"("id");
ALTER TABLE "Orders"."Package" ADD CONSTRAINT "type" FOREIGN KEY ("type") REFERENCES "Shipping"."Package"("id");
ALTER TABLE "Orders"."Package" ADD CONSTRAINT "carrier" FOREIGN KEY ("carrier") REFERENCES "Shipping"."Carrier"("id");
ALTER TABLE "Orders"."Payment" ADD CONSTRAINT "order" FOREIGN KEY ("order") REFERENCES "Orders"."Order"("id");
ALTER TABLE "Orders"."Payment" ADD CONSTRAINT "giftCard" FOREIGN KEY ("giftCard") REFERENCES "Products"."GiftCard"("id");
