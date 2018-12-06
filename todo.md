### Do posledneho reportiku este musime pridat:

 * select,  ktory podla mena banky vrati vsetky jej ucty:

SELECT a.number as acc_number, a.balance, a.created_at, c.first_name, c.last_name, cur.name as currency, a_t.label as acc_type FROM banks b
FULL OUTER JOIN accounts a ON a.bank_id = b.id
JOIN acc_types a_t ON a_t.id = a.acc_type_id
JOIN customers c ON c.id = a.customer_id 
JOIN currencies cur ON cur.id = a.currency_id
WHERE b.bank_name LIKE 'Rempel%';

stlpce:
acc_number
balance
created_at
first_name
last_name
currency
acc_type

 * select, ktory podla konkretneho uctu vypise vsetky transakcie na nom spolu s potrebnymi info:

SELECT t.name as tr_name, t.ammount, t.date, cur.name as cur_name, tr_t.label as tr_type, tr_s.label as tr_state 
FROM transactions t
JOIN currencies cur ON cur.id = t.currency_id
JOIN trans_states tr_s ON tr_s.id = t.trans_state_id
JOIN trans_types tr_t ON tr_t.id = t.trans_type_id
WHERE (t.account_id = 12);

stlpce:
tr_name
ammount
date
cur_name
tr_type
tr_state

### Ako by to mohlo vyzerat:

Na zaklade toho, ze pouzivatel zada meno banky (prvy select) sa mu zobrazia vsetky ucty spojene s tou danou bankou. Naviac, 
ukaze sa aj ich stav a vsetky kajnsmetkoviny. 

Ideal> ucty budu klikatelne a presmeruju na ten druhy select, na vypise transakcii konkretneho uctu, uvidime :)

#### toto by uz hadam mohlo stacit na final odovzdanie.
