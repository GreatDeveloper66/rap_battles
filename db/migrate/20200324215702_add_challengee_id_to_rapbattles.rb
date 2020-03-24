class AddChallengeeIdToRapbattles < ActiveRecord::Migration[6.0]
  def change
    add_column :rapbattles, :challengee_id, :string
  end
end
