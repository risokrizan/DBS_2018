class CreateAccTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :acc_types do |t|
      t.string :label

      t.timestamps
    end
  end
end
