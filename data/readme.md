# DBS 2018 CRYPTOBANK, Richard Krizan, Tomas Mizera

Na generovanie dát sme pouzili volne dostupny gem **FAKER**, bol vybraty hlavne kvoli implicitnej implementácii v **Ruby On Rails** a aj kvoli jeho rychlosti a moznosti generovania rozmanitych dat od vymyslu sveta, ako napríklad Game of Thrones Dragons :)

Kod na generovanie dát je v zložke `src/db/seeds.rb`
```ruby
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


1000000.times do
  Customer.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birth_date: Faker::Date.birthday,
      id_card_number: Faker::Number.number(7),
      street: Faker::Address.street_name,
      street_number: Faker::Address.building_number,
      city: Faker::Address.city,
      zip: Faker::Address.zip_code
  )
end
1000000.times do
  Bank.create(
      bank_name: Faker::Company.unique.name,
      street: Faker::Address.street_name,
      street_number: Faker::Address.building_number,
      city: Faker::Address.city,
      estabilished_date: Faker::Date.backward(100000)
  )
end
1000000.times do
  Account.create(
      number: Faker::Bank.iban("sk"),
      balance: Faker::Number.between(1, 1000),
      customer_id: Faker::Number.between(1, 1000000),
      bank_id: Faker::Number.between(1, 1000000),
      currency_id: Faker::Number.between(1, 10),
      acc_type_id: Faker::Number.between(1, 5)
  )
end
10000000.times do
  Transaction.create(
      name: Faker::GameOfThrones.dragon,
      ammount: Faker::Number.between(1, 10000),
      date: Faker::Date.backward(1000),
      account_id: Faker::Number.between(1, 1000000),
      currency_id: Faker::Number.between(1, 10),
      trans_type_id: Faker::Number.between(1, 5),
      trans_state_id: Faker::Number.between(1, 5)
  )
end
1000000.times do
  Computer.create(
      cpu_name: Faker::Lorem.word,
      cpu_clock: Faker::Number.decimal(1),
      cpu_cores: Faker::Number.between(1, 16),
      gpu_name: Faker::Lorem.word,
      gpu_clock: Faker::Number.decimal(1),
      gpu_cores: Faker::Number.between(1, 32),
      customer_id: Faker::Number.between(1, 1000000)
  )
end
1000000.times do
  Pool.create(
      name: Faker::Bitcoin.address,
      income: Faker::Number.between(1, 5000),
      bank_id: Faker::Number.between(1, 1000000),
      currency_id: Faker::Number.between(1, 10)
  )
end
1000000.times do
  IncomeByCustommer.create(
      date: Faker::Date.backward(50),
      income: Faker::Number.between(1, 5000),
      customer_id: Faker::Number.between(1, 1000000),
      pool_id: Faker::Number.between(1, 1000000)
  )
end
1000000.times do
  MiningHistory.create(
      connected_at: Faker::Date.backward(500),
      disconnected_at: Faker::Date.backward(500),
      computer_id: Faker::Number.between(1, 1000000),
      pool_id: Faker::Number.between(1, 1000000)
  )
end

```