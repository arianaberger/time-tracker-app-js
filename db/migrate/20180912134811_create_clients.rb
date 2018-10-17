class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
