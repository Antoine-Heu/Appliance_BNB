class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.string :user_comment
      t.string :owner_comment
      t.references :owner, foreign_key: { to_table: :users }
      t.references :booker, foreign_key: { to_table: :users }
      t.references :appliance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
