class CreateBridges < ActiveRecord::Migration[5.0]
  def change
    create_table :bridges do |t|
      t.integer :pilars_count, default: 6
      t.belongs_to :ice_field_game, foreign_key: true
      t.timestamps
    end
  end
end
