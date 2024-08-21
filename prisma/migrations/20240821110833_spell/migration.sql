/*
  Warnings:

  - The values [FARENHEIT] on the enum `TemperatureUnit` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "TemperatureUnit_new" AS ENUM ('CELSIUS', 'FAHRENHEIT');
ALTER TABLE "Customer" ALTER COLUMN "tempFormat" DROP DEFAULT;
ALTER TABLE "Customer" ALTER COLUMN "tempFormat" TYPE "TemperatureUnit_new" USING ("tempFormat"::text::"TemperatureUnit_new");
ALTER TYPE "TemperatureUnit" RENAME TO "TemperatureUnit_old";
ALTER TYPE "TemperatureUnit_new" RENAME TO "TemperatureUnit";
DROP TYPE "TemperatureUnit_old";
ALTER TABLE "Customer" ALTER COLUMN "tempFormat" SET DEFAULT 'CELSIUS';
COMMIT;
