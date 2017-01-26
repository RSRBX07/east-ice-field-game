class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.timestamps
    end
    add_column :dices, :game_id, :integer
    add_column :orchards, :game_id, :integer
    add_column :crows, :game_id, :integer
  end
end
