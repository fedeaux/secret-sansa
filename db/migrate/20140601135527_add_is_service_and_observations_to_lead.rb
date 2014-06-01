class AddIsServiceAndObservationsToLead < ActiveRecord::Migration
  def change
    add_column :leads, :is_service, :boolean
    add_column :leads, :observations, :text
  end
end
