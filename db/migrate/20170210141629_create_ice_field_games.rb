class CreateIceFieldGames < ActiveRecord::Migration[5.0]
  def change
    create_table :ice_field_games do |t|
      t.string :status
      t.timestamp :finished_at
      t.string :last_player_action

      t.timestamps
    end
  end
end
