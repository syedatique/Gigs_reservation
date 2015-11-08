class CreateViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.datetime :date
      t.integer :user_id
      t.integer :gig_id

      t.timestamps null: false
    end
  end
end
