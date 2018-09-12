class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.datetime :date
      t.time :start_time
      t.time :end_time
      t.string :notes
      t.integer :project_id

      t.timestamps
    end
  end
end
