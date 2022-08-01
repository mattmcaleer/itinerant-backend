class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :start_date
      t.string :completion_date

      t.timestamps
    end
  end
end
