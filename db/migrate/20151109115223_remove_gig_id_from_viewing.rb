class RemoveGigIdFromViewing < ActiveRecord::Migration
  def change
    remove_column :viewings, :gig_id, :integer
  end
end
