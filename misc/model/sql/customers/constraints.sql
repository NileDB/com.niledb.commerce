ALTER TABLE "Customers"."Timeline" ADD CONSTRAINT "customer" FOREIGN KEY ("customer") REFERENCES "Customers"."Customer"("id");
ALTER TABLE "Customers"."Recommendation" ADD CONSTRAINT "customer" FOREIGN KEY ("customer") REFERENCES "Customers"."Customer"("id");
ALTER TABLE "Customers"."Recommendation" ADD CONSTRAINT "item" FOREIGN KEY ("item") REFERENCES "Products"."Item"("id");
ALTER TABLE "Customers"."GroupCustomer" ADD CONSTRAINT "group" FOREIGN KEY ("group") REFERENCES "Customers"."Group"("id");
ALTER TABLE "Customers"."GroupCustomer" ADD CONSTRAINT "customer" FOREIGN KEY ("customer") REFERENCES "Customers"."Customer"("id");
