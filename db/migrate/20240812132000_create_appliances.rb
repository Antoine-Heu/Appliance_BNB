class CreateAppliances < ActiveRecord::Migration[7.1]
  def change
    create_table :appliances do |t|
      t.string :name
      t.string :type
      t.integer :price
      t.string :description
      t.string :condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
