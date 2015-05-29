DROP TABLE IF EXISTS agents CASCADE;
CREATE TABLE IF NOT EXISTS agents (
  id serial PRIMARY KEY,
  name varchar(255),
  contact_id integer
);


DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE IF NOT EXISTS customers (
  id serial PRIMARY KEY,
  current_contract_id integer,
  contact_id integer
);


DROP TABLE IF EXISTS contacts CASCADE;
CREATE TABLE IF NOT EXISTS contacts (
  id serial PRIMARY KEY,
  name varchar(255),
  email varchar(255),
  phone varchar(255)
);


DROP TABLE IF EXISTS contracts CASCADE;
CREATE TABLE IF NOT EXISTS contracts (
  id serial PRIMARY KEY,
  agent_id integer,
  customer_id integer,
  package_id integer,
  created_at timestamptz,
  expired_at timestamptz
);


DROP TABLE IF EXISTS insurance_packages CASCADE;
CREATE TABLE IF NOT EXISTS insurance_packages (
  id serial PRIMARY KEY,
  name varchar(255),
  description text,
  cost NUMERIC(12, 2)
);


DROP TABLE IF EXISTS subjects_of_insurance CASCADE;
CREATE TABLE IF NOT EXISTS subjects_of_insurance (
  id serial PRIMARY KEY,
  name varchar(255),
  description text,
  payout NUMERIC(12, 2)
);


DROP TABLE IF EXISTS packages_and_subjects CASCADE;
CREATE TABLE IF NOT EXISTS packages_and_subjects (
  package_id integer,
  subject_id integer
);


DROP TABLE IF EXISTS payouts CASCADE;
CREATE TABLE IF NOT EXISTS payouts (
  id serial PRIMARY KEY,
  contract_id integer,
  subject_id integer,
  note text,
  conclusion text,
  payout NUMERIC(12, 2)
);
