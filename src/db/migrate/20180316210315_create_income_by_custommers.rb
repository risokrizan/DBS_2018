class CreateIncomeByCustommers < ActiveRecord::Migration[5.1]
  def change
    create_table :income_by_custommers do |t|
      t.date :date
      t.integer :income

      t.timestamps
    end
  end
end
