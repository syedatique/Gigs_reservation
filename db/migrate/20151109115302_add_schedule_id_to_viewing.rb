class AddScheduleIdToViewing < ActiveRecord::Migration
  def change
    add_column :viewings, :schedule_id, :integer
  end
end
