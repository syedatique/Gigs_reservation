class RemoveScheduleFromSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :schedule, :date
  end
end
