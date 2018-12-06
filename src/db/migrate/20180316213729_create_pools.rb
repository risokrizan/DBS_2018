class CreatePools < ActiveRecord::Migration[5.1]
  def change
    create_table :pools do |t|
      t.string :name
      t.string :type
      t.integer :income

      t.timestamps
    end
  end
end
