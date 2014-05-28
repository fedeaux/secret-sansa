class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :name
      t.string :category
      t.string :address
      t.string :city
      t.string :state
      t.string :cep
      t.string :cnpj
      t.string :company_name

      t.timestamps
    end
  end
end
