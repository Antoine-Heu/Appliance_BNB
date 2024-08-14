class ReplaceTypeWithCategoryInAppliances < ActiveRecord::Migration[7.1]
  def change
    rename_column :appliances, :type, :category
  end
end
