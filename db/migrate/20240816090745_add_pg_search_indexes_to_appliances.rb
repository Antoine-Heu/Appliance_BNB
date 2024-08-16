class AddPgSearchIndexesToAppliances < ActiveRecord::Migration[7.1]
  def change
    add_index :appliances, :name
    add_index :appliances, :description
    add_index :appliances, :price
  end
end
