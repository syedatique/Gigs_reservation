class RemoveThemeFromGig < ActiveRecord::Migration
  def change
    remove_column :gigs, :theme, :string
  end
end
