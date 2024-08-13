class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :starting_date
      t.datetime :end_date
      t.string :owner_comment
      t.string :user_comment
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :appliance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
