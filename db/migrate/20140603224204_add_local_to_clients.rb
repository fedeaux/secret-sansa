class AddLocalToClients < ActiveRecord::Migration
  def change
    add_column :clients, :local_id, :integer
  end
end
