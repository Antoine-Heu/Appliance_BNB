class AddUserIdToAppliances < ActiveRecord::Migration[7.1]
  def change
    add_reference :appliances, :user, null: false, foreign_key: true
  end
end
