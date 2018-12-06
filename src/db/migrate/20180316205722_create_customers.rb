class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :id_card_number
      t.string :street
      t.string :city
      t.integer :zip
      t.integer :street_number

      t.timestamps
    end
  end
end
