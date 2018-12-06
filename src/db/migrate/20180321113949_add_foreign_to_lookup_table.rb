class AddForeignToLookupTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :accounts, :currency
    add_column :accounts, :currency_id, :integer
    add_foreign_key :accounts, :currencies
    add_column :accounts, :acc_type_id, :integer
    add_foreign_key :accounts, :acc_types

    remove_column :transactions, :type
    remove_column :transactions, :state
    add_column :transactions, :currency_id, :integer
    add_column :transactions, :trans_type_id, :integer
    add_column :transactions, :trans_state_id, :integer
    add_foreign_key :transactions, :currencies
    add_foreign_key :transactions, :trans_types
    add_foreign_key :transactions, :trans_states

    remove_column :pools, :type
    add_column :pools, :currency_id, :integer
    add_foreign_key :pools, :currencies

    Currency.create :name => "Bitcoin", :value => 9155.17
    Currency.create :name => "Etherum", :value => 583.47
    Currency.create :name => "Ripple", :value => 0.712
    Currency.create :name => "Litecoin", :value => 174.74
    Currency.create :name => "Cardano", :value => 0.2235
    Currency.create :name => "Stellar", :value => 0.266
    Currency.create :name => "IOTA", :value => 1.43
    Currency.create :name => "DigixDAO", :value => 366.78
    Currency.create :name => "Hshare", :value => 6.51
    Currency.create :name => "SALT", :value => 2.76

    AccType.create :label => "Classic"
    AccType.create :label => "Investing"
    AccType.create :label => "Debet"
    AccType.create :label => "Crypto Maniac"
    AccType.create :label => "EXXXTREME Minner"

    TransType.create :label => "Money transfer from pool to account"
    TransType.create :label => "Money transfer from account to pool"
    TransType.create :label => "Money transfer between accounts"
    TransType.create :label => "External money transfer"
    TransType.create :label => "Bank fees"

    TransState.create :label => "Done"
    TransState.create :label => "Pending"
    TransState.create :label => "Blocked"
    TransState.create :label => "Not paid yet"
    TransState.create :label => "Waiting for approval"

  end
end
