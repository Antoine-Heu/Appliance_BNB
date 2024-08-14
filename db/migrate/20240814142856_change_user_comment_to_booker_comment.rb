class ChangeUserCommentToBookerComment < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :user_comment, :booker_comment
  end
end
