class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.string :bank_name
      t.string :street
      t.string :city
      t.date :estabilished_date

      t.timestamps
    end
  end
end
