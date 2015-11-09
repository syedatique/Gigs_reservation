class RenameViewingsToBookings < ActiveRecord::Migration
  def change
    rename_table :viewings, :bookings
  end
end
