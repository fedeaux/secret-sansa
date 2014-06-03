class AddLeadIdToLeadEntry < ActiveRecord::Migration
  def change
    add_column :lead_entries, :lead_id, :integer
  end
end
