class CreateComputers < ActiveRecord::Migration[5.1]
  def change
    create_table :computers do |t|
      t.string :cpu_name
      t.float :cpu_clock
      t.integer :cpu_cores
      t.string :gpu_name
      t.float :gpu_clock
      t.integer :gpu_cores

      t.timestamps
    end
  end
end
