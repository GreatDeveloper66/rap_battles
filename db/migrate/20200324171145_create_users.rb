class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :imgurl, default: 'blank_person.jpg'
    end
  end
end
