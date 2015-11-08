class AddGenreIdToGig < ActiveRecord::Migration
  def change
    add_column :gigs, :genre_id, :integer
  end
end
