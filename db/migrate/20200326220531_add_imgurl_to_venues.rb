class AddImgurlToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :imgurl, :string
  end
end
