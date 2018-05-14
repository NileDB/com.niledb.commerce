ALTER TABLE "Globals"."Province" ADD CONSTRAINT "country" FOREIGN KEY ("country") REFERENCES "Globals"."Country"("id");
