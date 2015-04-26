class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.datetime :start_date
      t.integer :duration
      t.integer :max_cost
      t.integer :min_cost
      t.boolean :voting_active?
      t.string :departure_airport

      t.timestamps null: false
    end
  end
end
