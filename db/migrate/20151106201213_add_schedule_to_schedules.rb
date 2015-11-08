class AddScheduleToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :schedule, :datetime
  end
end
