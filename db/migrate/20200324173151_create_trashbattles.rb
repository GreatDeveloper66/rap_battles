class CreateTrashbattles < ActiveRecord::Migration[6.0]
  def change
    create_table :trashbattles do |t|
      t.integer :trashtalk_id
      t.integer :rapbattle_id
    end
  end
end
