class AllowedMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
      t.timestamps
    end
    add_column :rules, :crow_allowed_moves, :integer
  end
end
