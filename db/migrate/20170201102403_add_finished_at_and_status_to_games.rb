class AddFinishedAtAndStatusToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :finished_at, :datetime
    add_column :games, :status, :string
  end
end
