class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :title
      t.text :observations

      t.timestamps
    end
  end
end
