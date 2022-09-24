CREATE TABLE merchant_cate (
    id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    CONSTRAINT pk_merchant_cate PRIMARY KEY (
        id
     )
);

CREATE TABLE merchant (
    id INT NOT NULL,
    name VARCHAR(60) NOT NULL,
    id_merchant_category INT NOT NULL,
    CONSTRAINT pk_merchant PRIMARY KEY (
        id
     )
);

CREATE TABLE card_holder (
    id INT   NOT NULL,
    name VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_card_holder PRIMARY KEY (
        id
     )
);

CREATE TABLE credit_card (
    card INT   NOT NULL,
    cardholder_id INT   NOT NULL
);

CREATE TABLE transaction (
    id INT   NOT NULL,
    date TIMESTAMP   NOT NULL,
    amount float   NOT NULL,
    card INT   NOT NULL,
    id_merchant INT   NOT NULL,
    CONSTRAINT pk_transaction PRIMARY KEY (
        id
     )
);

ALTER TABLE merchant_cate ADD CONSTRAINT fk_merchant_cate_id FOREIGN KEY(id)
REFERENCES merchant (id_merchant_category);

ALTER TABLE merchant ADD CONSTRAINT fk_merchant_id FOREIGN KEY(id)
REFERENCES transaction (id_merchant);

ALTER TABLE card_holder ADD CONSTRAINT fk_card_holder_id FOREIGN KEY(id)
REFERENCES credit_card (cardholder_id);

ALTER TABLE credit_card ADD CONSTRAINT fk_credit_card_card FOREIGN KEY(card)
REFERENCES transaction (card);

