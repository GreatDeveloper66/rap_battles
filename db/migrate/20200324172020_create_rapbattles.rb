class CreateRapbattles < ActiveRecord::Migration[6.0]
  def change
    create_table :rapbattles do |t|
      t.integer :challenger_id
      t.integer :challengee_id
      t.integer :venue_id
      t.integer :challenger_points
      t.integer :challengee_points
    end
  end
end
