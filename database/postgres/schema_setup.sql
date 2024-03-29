CREATE SCHEMA "artbase";

CREATE TYPE "artbase"."artwork_status" AS ENUM (
  'Sale',
  'View',
  'Sold'
);

CREATE TYPE "artbase"."measurement_unit" AS ENUM (
  'Inches',
  'Centimeters',
  'Feet'
);

CREATE TYPE "artbase"."currency" AS ENUM (
  'INR',
  'USD',
  'EUR'
);

CREATE TABLE "artbase"."customer" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar NOT NULL,
  "country" varchar,
  "state" varchar,
  "city" varchar,
  "home_address" varchar,
  "apartment_name" varchar,
  "flat_number" varchar,
  "floor" varchar,
  "tower" varchar,
  "phone_number" bigint,
  "country_code" int,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "artbase"."country" (
  "country_code" int PRIMARY KEY,
  "country" varchar UNIQUE NOT NULL
);

CREATE TABLE "artbase"."artist" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar NOT NULL,
  "country" varchar NOT NULL,
  "state" varchar NOT NULL,
  "birth_year" date NOT NULL,
  "statement" varchar NOT NULL,
  "picture_url" varchar,
  "styles" jsonb,
  "social_links" jsonb,
  "phone_number" bigint,
  "country_code" int,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "artbase"."artist_style" (
  "aid" int NOT NULL,
  "style" varchar NOT NULL,
  PRIMARY KEY ("aid", "style")
);

CREATE TABLE "artbase"."artwork" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar NOT NULL,
  "style" varchar DEFAULT 'Uncategorized',
  "aid" int NOT NULL,
  "year" int NOT NULL,
  "height" real,
  "width" real,
  "measurement_unit" artbase.measurement_unit,
  "price" real,
  "currency" artbase.currency,
  "picture_url" varchar NOT NULL,
  "status" artbase.artwork_status NOT NULL
);

CREATE TABLE "artbase"."transaction" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "artwork_id" int NOT NULL,
  "customer_id" int NOT NULL,
  "artist_id" int NOT NULL,
  "purchase_date" timestamp
);

CREATE INDEX ON "artbase"."customer" ("email");

CREATE INDEX ON "artbase"."artist" ("email");

CREATE INDEX ON "artbase"."artist_style" ("style");

CREATE INDEX ON "artbase"."artwork" ("title", "aid");

CREATE INDEX ON "artbase"."transaction" ("customer_id");

CREATE INDEX ON "artbase"."transaction" ("artist_id");

COMMENT ON COLUMN "artbase"."customer"."home_address" IS 'House number, street name, etc.';

COMMENT ON COLUMN "artbase"."country"."country_code" IS 'Country code, for example, 91 for India';

COMMENT ON COLUMN "artbase"."artist"."picture_url" IS 'TODO: Put in a default user image later';

COMMENT ON COLUMN "artbase"."transaction"."purchase_date" IS 'Trigger will insert now() in this field';

ALTER TABLE "artbase"."customer" ADD FOREIGN KEY ("country_code") REFERENCES "artbase"."country" ("country_code");

ALTER TABLE "artbase"."artist" ADD FOREIGN KEY ("country_code") REFERENCES "artbase"."country" ("country_code");

ALTER TABLE "artbase"."artist_style" ADD FOREIGN KEY ("aid") REFERENCES "artbase"."artist" ("id");

ALTER TABLE "artbase"."artwork" ADD FOREIGN KEY ("aid") REFERENCES "artbase"."artist" ("id");

ALTER TABLE "artbase"."transaction" ADD FOREIGN KEY ("artwork_id") REFERENCES "artbase"."artwork" ("id");

ALTER TABLE "artbase"."transaction" ADD FOREIGN KEY ("customer_id") REFERENCES "artbase"."customer" ("id");

ALTER TABLE "artbase"."transaction" ADD FOREIGN KEY ("artist_id") REFERENCES "artbase"."artist" ("id");
