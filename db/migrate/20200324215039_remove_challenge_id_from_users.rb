class RemoveChallengeIdFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :challenge_id, :string
  end
end
