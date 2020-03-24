class RemoveChallengeIdFromRapbattles < ActiveRecord::Migration[6.0]
  def change

    remove_column :rapbattles, :challenge_id, :string
  end
end
