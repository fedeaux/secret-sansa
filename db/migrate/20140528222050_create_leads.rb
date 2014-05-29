class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :subject
      t.datetime :last_event_on
      t.integer :status
      t.boolean :has_pendencies
      t.boolean :has_file_pendencies
      t.boolean :disabled

      t.timestamps
    end
  end
end
