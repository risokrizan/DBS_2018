class CreateMiningHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :mining_histories do |t|
      t.datetime :connected_at
      t.datetime :disconnected_at

      t.timestamps
    end
  end
end
