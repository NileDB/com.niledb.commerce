ALTER TABLE "Products"."Item" ADD CONSTRAINT "tax" FOREIGN KEY ("tax") REFERENCES "Orders"."Tax"("id");
ALTER TABLE "Products"."ItemImage" ADD CONSTRAINT "item" FOREIGN KEY ("item") REFERENCES "Products"."Item"("id");
ALTER TABLE "Products"."ItemImage" ADD CONSTRAINT "image" FOREIGN KEY ("image") REFERENCES "Globals"."Image"("id");
ALTER TABLE "Products"."Variant" ADD CONSTRAINT "item" FOREIGN KEY ("item") REFERENCES "Products"."Item"("id");
ALTER TABLE "Products"."VariantImage" ADD CONSTRAINT "variant" FOREIGN KEY ("variant") REFERENCES "Products"."Variant"("id");
ALTER TABLE "Products"."VariantImage" ADD CONSTRAINT "image" FOREIGN KEY ("image") REFERENCES "Globals"."Image"("id");
ALTER TABLE "Products"."InventoryAdjustment" ADD CONSTRAINT "variant" FOREIGN KEY ("variant") REFERENCES "Products"."Variant"("id");
ALTER TABLE "Products"."Collection" ADD CONSTRAINT "image" FOREIGN KEY ("image") REFERENCES "Globals"."Image"("id");
ALTER TABLE "Products"."Collection" ADD CONSTRAINT "tax" FOREIGN KEY ("tax") REFERENCES "Orders"."Tax"("id");
ALTER TABLE "Products"."CollectionItem" ADD CONSTRAINT "collection" FOREIGN KEY ("collection") REFERENCES "Products"."Collection"("id");
ALTER TABLE "Products"."CollectionItem" ADD CONSTRAINT "item" FOREIGN KEY ("item") REFERENCES "Products"."Item"("id");
ALTER TABLE "Products"."Hierarchy" ADD CONSTRAINT "parent" FOREIGN KEY ("parent") REFERENCES "Products"."Hierarchy"("id");
ALTER TABLE "Products"."HierarchyCollection" ADD CONSTRAINT "hierarchy" FOREIGN KEY ("hierarchy") REFERENCES "Products"."Hierarchy"("id");
ALTER TABLE "Products"."HierarchyCollection" ADD CONSTRAINT "collection" FOREIGN KEY ("collection") REFERENCES "Products"."Collection"("id");
ALTER TABLE "Products"."Publication" ADD CONSTRAINT "collection" FOREIGN KEY ("collection") REFERENCES "Products"."Collection"("id");
ALTER TABLE "Products"."GiftCard" ADD CONSTRAINT "customer" FOREIGN KEY ("customer") REFERENCES "Customers"."Customer"("id");
ALTER TABLE "Products"."Review" ADD CONSTRAINT "item" FOREIGN KEY ("item") REFERENCES "Products"."Item"("id");
ALTER TABLE "Products"."Review" ADD CONSTRAINT "customer" FOREIGN KEY ("customer") REFERENCES "Customers"."Customer"("id");
ALTER TABLE "Products"."Review" ADD CONSTRAINT "orderLine" FOREIGN KEY ("orderLine") REFERENCES "Orders"."OrderLine"("id");
