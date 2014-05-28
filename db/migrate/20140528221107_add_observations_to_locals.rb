class AddObservationsToLocals < ActiveRecord::Migration
  def change
    add_column :locals, :observations, :text
  end
end
