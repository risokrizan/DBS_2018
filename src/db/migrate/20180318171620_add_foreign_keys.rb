class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change

    #foreign keys pre entitu computers
    add_column :computers, :customer_id, :integer
    add_foreign_key :computers, :customers

    #foreign keys pre entitu mining historie
    add_column :mining_histories, :computer_id, :integer
    add_column :mining_histories, :pool_id, :integer
    add_foreign_key :mining_histories, :computers
    add_foreign_key :mining_histories, :pools

    #foreign keys pre entitu income_by_custommers
    add_column :income_by_custommers, :customer_id, :integer
    add_column :income_by_custommers, :pool_id, :integer
    add_foreign_key :income_by_custommers, :customers
    add_foreign_key :income_by_custommers, :pools

    #foreign keys pre entitu accounts
    add_column :accounts, :customer_id, :integer
    add_column :accounts, :bank_id, :integer
    add_foreign_key :accounts, :customers
    add_foreign_key :accounts, :banks

    #foreign keys pre entitu pools
    add_column :pools, :bank_id, :integer
    add_foreign_key :pools, :banks

    #foreign keys pre entitu transactions
    add_column :transactions, :account_id, :integer
    add_foreign_key :transactions, :accounts

    #premenovanie tabulky
    #rename_table :income_by_custommers, :income_by_customers
  end
end
