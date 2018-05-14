ALTER TABLE "Channels"."Store" ADD CONSTRAINT "discountToApplyToAbandonedCarts" FOREIGN KEY ("discountToApplyToAbandonedCarts") REFERENCES "Marketing"."Discount"("id");
