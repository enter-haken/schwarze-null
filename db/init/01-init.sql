CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE application_meta(
  id UUID NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
  key VARCHAR(256),
  value VARCHAR(256),
  UNIQUE (key)
);

CREATE TABLE booking(
  id UUID NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
  booking_day TIMESTAMP,
  value_day TIMESTAMP,
  booking_text VARCHAR(256),
  usage_text VARCHAR(4096),
  creditor_id VARCHAR(256),
  mandate_reference VARCHAR(256),
  collector_reference VARCHAR(256),
  direct_debit VARCHAR(256),
  direct_debit_original_value MONEY,
  reimbursement_of_expenses VARCHAR(256),
  beneficiary VARCHAR(256),
  iban VARCHAR(256),
  bic VARCHAR(256),
  value MONEY,
  currency VARCHAR(256),
  info VARCHAR(256)
);
