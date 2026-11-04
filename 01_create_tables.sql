CREATE TABLE IF NOT EXISTS "aircraft" (
	"aircraft_id" serial NOT NULL,
    "tail_number" varchar(20) NOT NULL UNIQUE,
	"serial_number" varchar(100) NOT NULL UNIQUE,
	"model" varchar(100) NOT NULL,
	"manufacturer" varchar(100),
	"status" varchar(30) NOT NULL DEFAULT 'active',
	PRIMARY KEY ("aircraft_id")
);

CREATE TABLE IF NOT EXISTS "repair_tickets" (
	"ticket_id" serial NOT NULL,
	"ticket_number" varchar(50) NOT NULL UNIQUE,
	"aircraft_id" integer NOT NULL,
	"reported_at" timestamp without time zone NOT NULL,
	"opened_by" varchar(100),
	"priority" varchar(20) NOT NULL DEFAULT 'normal',
	"status" varchar(30) NOT NULL DEFAULT 'open',
	"problem_description" text NOT NULL,
	"closed_at" timestamp without time zone,
	PRIMARY KEY ("ticket_id")
);

CREATE TABLE IF NOT EXISTS "parts" (
	"part_id" serial NOT NULL,
	"part_number" varchar(100) NOT NULL UNIQUE,
	"part_name" varchar(200) NOT NULL,
	"description" text,
	PRIMARY KEY ("part_id")
);

CREATE TABLE IF NOT EXISTS "repair_ticket_parts" (
	"ticket_part_id" serial NOT NULL,
	"ticket_id" integer NOT NULL,
	"part_id" integer NOT NULL,
	"quantity" numeric(12,2) NOT NULL,
	"unit_cost_at_use" numeric(12,2),
	"installed_at" timestamp without time zone,
	"notes" text,
	PRIMARY KEY ("ticket_part_id")
);

CREATE TABLE IF NOT EXISTS "repair_actions" (
	"action_id" serial NOT NULL,
	"ticket_id" integer NOT NULL,
	"action_at" timestamp without time zone NOT NULL,
	"performed_by" varchar(100),
	"action_type" varchar(50) NOT NULL,
	"description" text NOT NULL,
	PRIMARY KEY ("action_id")
);

ALTER TABLE "repair_tickets" ADD CONSTRAINT "repair_tickets_fk2" FOREIGN KEY ("aircraft_id") REFERENCES "aircraft"("aircraft_id");
ALTER TABLE "repair_ticket_parts" ADD CONSTRAINT "repair_ticket_parts_fk1" FOREIGN KEY ("ticket_id") REFERENCES "repair_tickets"("ticket_id");
ALTER TABLE "repair_ticket_parts" ADD CONSTRAINT "repair_ticket_parts_fk2" FOREIGN KEY ("part_id") REFERENCES "parts"("part_id");
ALTER TABLE "repair_actions" ADD CONSTRAINT "repair_actions_fk1" FOREIGN KEY ("ticket_id") REFERENCES "repair_tickets"("ticket_id");
