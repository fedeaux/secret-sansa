class CreateLeadEntries < ActiveRecord::Migration
  def change
    create_table :lead_entries do |t|
      t.text :text
      t.date :date
      t.string :relation

      t.timestamps
    end
  end
end
