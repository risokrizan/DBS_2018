CREATE TABLE schema_migrations
(
  version VARCHAR NOT NULL
    CONSTRAINT schema_migrations_pkey
    PRIMARY KEY
);

CREATE TABLE ar_internal_metadata
(
  key        VARCHAR   NOT NULL
    CONSTRAINT ar_internal_metadata_pkey
    PRIMARY KEY,
  value      VARCHAR,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE customers
(
  id             BIGSERIAL NOT NULL
    CONSTRAINT customers_pkey
    PRIMARY KEY,
  first_name     VARCHAR,
  last_name      VARCHAR,
  birth_date     DATE,
  id_card_number VARCHAR,
  street         VARCHAR,
  city           VARCHAR,
  zip            INTEGER,
  street_number  INTEGER,
  created_at     TIMESTAMP NOT NULL,
  updated_at     TIMESTAMP NOT NULL
);

CREATE TABLE mining_histories
(
  id              BIGSERIAL NOT NULL
    CONSTRAINT mining_histories_pkey
    PRIMARY KEY,
  connected_at    TIMESTAMP,
  disconnected_at TIMESTAMP,
  created_at      TIMESTAMP NOT NULL,
  updated_at      TIMESTAMP NOT NULL,
  computer_id     INTEGER,
  pool_id         INTEGER
);

CREATE TABLE income_by_custommers
(
  id          BIGSERIAL NOT NULL
    CONSTRAINT income_by_custommers_pkey
    PRIMARY KEY,
  date        DATE,
  income      INTEGER,
  created_at  TIMESTAMP NOT NULL,
  updated_at  TIMESTAMP NOT NULL,
  customer_id INTEGER
    CONSTRAINT fk_rails_a94e3dbcae
    REFERENCES customers,
  pool_id     INTEGER
);

CREATE TABLE accounts
(
  id          BIGSERIAL NOT NULL
    CONSTRAINT accounts_pkey
    PRIMARY KEY,
  number      VARCHAR,
  balance     INTEGER,
  created_at  TIMESTAMP NOT NULL,
  updated_at  TIMESTAMP NOT NULL,
  customer_id INTEGER
    CONSTRAINT fk_rails_990d303a5d
    REFERENCES customers,
  bank_id     INTEGER,
  currency_id INTEGER,
  acc_type_id INTEGER
);

CREATE TABLE banks
(
  id                BIGSERIAL NOT NULL
    CONSTRAINT banks_pkey
    PRIMARY KEY,
  bank_name         VARCHAR,
  street            VARCHAR,
  city              VARCHAR,
  estabilished_date DATE,
  created_at        TIMESTAMP NOT NULL,
  updated_at        TIMESTAMP NOT NULL,
  street_number     INTEGER
);

ALTER TABLE accounts
  ADD CONSTRAINT fk_rails_0ea11b1ca4
FOREIGN KEY (bank_id) REFERENCES banks;

CREATE TABLE transactions
(
  id             BIGSERIAL NOT NULL
    CONSTRAINT transactions_pkey
    PRIMARY KEY,
  name           VARCHAR,
  ammount        INTEGER,
  date           TIMESTAMP,
  created_at     TIMESTAMP NOT NULL,
  updated_at     TIMESTAMP NOT NULL,
  account_id     INTEGER
    CONSTRAINT fk_rails_01f020e267
    REFERENCES accounts,
  currency_id    INTEGER,
  trans_type_id  INTEGER,
  trans_state_id INTEGER
);

CREATE TABLE pools
(
  id          BIGSERIAL NOT NULL
    CONSTRAINT pools_pkey
    PRIMARY KEY,
  name        VARCHAR,
  income      INTEGER,
  created_at  TIMESTAMP NOT NULL,
  updated_at  TIMESTAMP NOT NULL,
  bank_id     INTEGER
    CONSTRAINT fk_rails_984aa52e12
    REFERENCES banks,
  currency_id INTEGER
);

ALTER TABLE mining_histories
  ADD CONSTRAINT fk_rails_175a21df0f
FOREIGN KEY (pool_id) REFERENCES pools;

ALTER TABLE income_by_custommers
  ADD CONSTRAINT fk_rails_a3ee8545de
FOREIGN KEY (pool_id) REFERENCES pools;

CREATE TABLE computers
(
  id          BIGSERIAL NOT NULL
    CONSTRAINT computers_pkey
    PRIMARY KEY,
  cpu_name    VARCHAR,
  cpu_clock   DOUBLE PRECISION,
  cpu_cores   INTEGER,
  gpu_name    VARCHAR,
  gpu_clock   DOUBLE PRECISION,
  gpu_cores   INTEGER,
  created_at  TIMESTAMP NOT NULL,
  updated_at  TIMESTAMP NOT NULL,
  customer_id INTEGER
    CONSTRAINT fk_rails_c46da31077
    REFERENCES customers
);

ALTER TABLE mining_histories
  ADD CONSTRAINT fk_rails_6d427c4ae4
FOREIGN KEY (computer_id) REFERENCES computers;

CREATE TABLE announcements
(
  id         BIGSERIAL NOT NULL
    CONSTRAINT announcements_pkey
    PRIMARY KEY,
  author     VARCHAR,
  text       TEXT,
  date       TIMESTAMP,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE currencies
(
  id         BIGSERIAL NOT NULL
    CONSTRAINT currencies_pkey
    PRIMARY KEY,
  name       VARCHAR,
  value      DOUBLE PRECISION,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

ALTER TABLE accounts
  ADD CONSTRAINT fk_rails_dd73f000d2
FOREIGN KEY (currency_id) REFERENCES currencies;

ALTER TABLE transactions
  ADD CONSTRAINT fk_rails_4de1cc7140
FOREIGN KEY (currency_id) REFERENCES currencies;

ALTER TABLE pools
  ADD CONSTRAINT fk_rails_40d80bf57d
FOREIGN KEY (currency_id) REFERENCES currencies;

CREATE TABLE acc_types
(
  id         BIGSERIAL NOT NULL
    CONSTRAINT acc_types_pkey
    PRIMARY KEY,
  label      VARCHAR,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

ALTER TABLE accounts
  ADD CONSTRAINT fk_rails_24b31d85ce
FOREIGN KEY (acc_type_id) REFERENCES acc_types;

CREATE TABLE trans_types
(
  id         BIGSERIAL NOT NULL
    CONSTRAINT trans_types_pkey
    PRIMARY KEY,
  label      VARCHAR,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

ALTER TABLE transactions
  ADD CONSTRAINT fk_rails_b30694bb93
FOREIGN KEY (trans_type_id) REFERENCES trans_types;

CREATE TABLE trans_states
(
  id         BIGSERIAL NOT NULL
    CONSTRAINT trans_states_pkey
    PRIMARY KEY,
  label      VARCHAR,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

ALTER TABLE transactions
  ADD CONSTRAINT fk_rails_a706aadffa
FOREIGN KEY (trans_state_id) REFERENCES trans_states;


