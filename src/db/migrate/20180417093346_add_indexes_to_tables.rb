class AddIndexesToTables < ActiveRecord::Migration[5.1]
  def change
  	add_index :customers, [:first_name, :last_name]
  	add_index :accounts, :bank_id 
  	add_index :accounts, :customer_id
  	add_index :accounts, :number
  	add_index :banks, :bank_name
  	add_index :computers, :customer_id
  	add_index :pools, :name
  	add_index :pools, :bank_id
  	add_index :transactions, :account_id
  	add_index :transactions, :trans_state_id  	

  end
end
