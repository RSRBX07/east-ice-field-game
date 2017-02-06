class CheckLastAction < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :last_player_action, :string
  end
end
