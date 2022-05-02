CREATE TABLE "customers" (
	"customer_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	"phone_number" int8 NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "sales_persons" (
	"sales_person_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"customer_id" int NOT NULL,
	CONSTRAINT "sales_persons_pk" PRIMARY KEY ("sales_person_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "invoices" (
	"invoices_id" serial NOT NULL,
	"amount" float8 NOT NULL,
	"date_of_purchase" TIMESTAMP NOT NULL,
	"customer_id" int NOT NULL,
	"sales_person_id" int NOT NULL,
	CONSTRAINT "invoices_pk" PRIMARY KEY ("invoices_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "cars" (
	"car_id" serial NOT NULL,
	"car_type_id" int NOT NULL,
	"sales_person_id" int NOT NULL,
	"customer_id" int NOT NULL,
	CONSTRAINT "cars_pk" PRIMARY KEY ("car_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "car_types" (
	"car_type_id" serial NOT NULL,
	"car_make" varchar(255) NOT NULL,
	"car_model" varchar(255) NOT NULL,
	"car_year" int NOT NULL,
	CONSTRAINT "car_types_pk" PRIMARY KEY ("car_type_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "mechanics" (
	"mechanic_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"store_id" int NOT NULL,
	"car_type_id" int NOT NULL,
	"service_id" int NOT NULL,
	CONSTRAINT "mechanics_pk" PRIMARY KEY ("mechanic_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "stores" (
	"store_id" serial NOT NULL,
	"address" varchar(255) NOT NULL,
	CONSTRAINT "stores_pk" PRIMARY KEY ("store_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "inventory" (
	"inventory_id" serial NOT NULL,
	"stock" int NOT NULL,
	"store_id" int NOT NULL,
	"car_type_id" int NOT NULL,
	CONSTRAINT "inventory_pk" PRIMARY KEY ("inventory_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "services" (
	"service_id" serial NOT NULL,
	"service_type" varchar(255) NOT NULL,
	"cars" int NOT NULL,
	CONSTRAINT "services_pk" PRIMARY KEY ("service_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "sales_persons" ADD CONSTRAINT "sales_persons_fk0" FOREIGN KEY ("customer_id") REFERENCES "customers"("customer_id");
ALTER TABLE "invoices" ADD CONSTRAINT "invoices_fk0" FOREIGN KEY ("customer_id") REFERENCES "customers"("customer_id");
ALTER TABLE "invoices" ADD CONSTRAINT "invoices_fk1" FOREIGN KEY ("sales_person_id") REFERENCES "sales_persons"("sales_person_id");

ALTER TABLE "cars" ADD CONSTRAINT "cars_fk0" FOREIGN KEY ("car_type_id") REFERENCES "car_types"("car_type_id");
ALTER TABLE "cars" ADD CONSTRAINT "cars_fk1" FOREIGN KEY ("sales_person_id") REFERENCES "sales_persons"("sales_person_id");
ALTER TABLE "cars" ADD CONSTRAINT "cars_fk2" FOREIGN KEY ("customer_id") REFERENCES "customers"("customer_id");


ALTER TABLE "mechanics" ADD CONSTRAINT "mechanics_fk0" FOREIGN KEY ("store_id") REFERENCES "stores"("store_id");
ALTER TABLE "mechanics" ADD CONSTRAINT "mechanics_fk1" FOREIGN KEY ("car_type_id") REFERENCES "car_types"("car_type_id");
ALTER TABLE "mechanics" ADD CONSTRAINT "mechanics_fk2" FOREIGN KEY ("service_id") REFERENCES "services"("service_id");


ALTER TABLE "inventory" ADD CONSTRAINT "inventory_fk0" FOREIGN KEY ("store_id") REFERENCES "stores"("store_id");
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_fk1" FOREIGN KEY ("car_type_id") REFERENCES "car_types"("car_type_id");

ALTER TABLE "services" ADD CONSTRAINT "services_fk0" FOREIGN KEY ("cars") REFERENCES "cars"("car_id");












