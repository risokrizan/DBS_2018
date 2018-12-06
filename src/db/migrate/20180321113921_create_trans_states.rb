class CreateTransStates < ActiveRecord::Migration[5.1]
  def change
    create_table :trans_states do |t|
      t.string :label

      t.timestamps
    end
  end
end
