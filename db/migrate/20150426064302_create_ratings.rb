class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :location, index: true, foreign_key: true
      t.integer :vote

      t.timestamps null: false
    end
  end
end
