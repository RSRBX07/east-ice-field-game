class AddRulesToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :rules, :game_id, :integer
  end
end
