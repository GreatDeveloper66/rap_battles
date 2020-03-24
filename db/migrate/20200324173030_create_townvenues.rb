class CreateTownvenues < ActiveRecord::Migration[6.0]
  def change
    create_table :townvenues do |t|
      t.integer :town_id
      t.integer :venue_id
    end
  end
end
