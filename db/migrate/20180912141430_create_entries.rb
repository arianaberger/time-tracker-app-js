class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.datetime :date
      t.time :start_time
      t.time :end_time
      t.string :notes
      
      t.belongs_to :project, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true    

      t.timestamps
    end
  end
end
