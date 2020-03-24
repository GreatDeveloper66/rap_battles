class CreateTrashtalks < ActiveRecord::Migration[6.0]
  def change
    create_table :trashtalks do |t|
      t.string :snippet
      t.integer :points
    end
  end
end
