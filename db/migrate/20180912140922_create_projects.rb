class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :status
      t.datetime :deadline

      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps
    end
  end
end
