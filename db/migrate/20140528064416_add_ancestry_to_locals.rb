class AddAncestryToLocals < ActiveRecord::Migration
  def change
    add_column :locals, :ancestry, :string
  end
end
