class Fix < ActiveRecord::Migration[5.1]
  def change
    add_column :banks, :street_number, :integer
    change_column :accounts, :number, :string
    add_column :transactions, :state, :string
  end
end
