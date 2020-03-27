class AddImgurlToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :imgurl, :string, default: 'blank_person.jpg'
  end
end
