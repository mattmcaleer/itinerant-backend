class CreateItineraries < ActiveRecord::Migration[6.1]
  def change
    create_table :itineraries do |t|
      t.date :start_date
      t.date :end_date
      t.string :name

      t.timestamps
    end
  end
end
