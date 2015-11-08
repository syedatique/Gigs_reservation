class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :schedule
      t.integer :gig_id
      t.integer :venue_id

      t.timestamps null: false
    end
  end
end
