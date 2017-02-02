class AddGamesplayers < ActiveRecord::Migration[5.0]
  def change
    create_table :games_users do |t|
      t.integer :user_id
      t.integer :game_id
      t.timestamps  
    end
  end
end
