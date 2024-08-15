class AddImageUrlToAppliances < ActiveRecord::Migration[7.1]
  def change
    add_column :appliances, :image_url, :string
  end
end
