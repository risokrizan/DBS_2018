class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.string :author
      t.text :text
      t.datetime :date

      t.timestamps
    end
  end
end
