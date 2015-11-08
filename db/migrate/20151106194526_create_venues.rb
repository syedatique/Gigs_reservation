class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.integer :seat

      t.timestamps null: false
    end
  end
end
