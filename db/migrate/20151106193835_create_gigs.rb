class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :name
      t.string :gig_image
      t.text :description
      t.string :theme

      t.timestamps null: false
    end
  end
end
