class CreateAppliances < ActiveRecord::Migration[7.1]
  def change
    create_table :appliances do |t|
      t.string :name
      t.string :type
      t.integer :price
      t.integer :eaters
      t.string :description
      t.string :condition

      t.timestamps
    end
  end
end
