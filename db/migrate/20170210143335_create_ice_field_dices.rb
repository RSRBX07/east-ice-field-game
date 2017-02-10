class CreateIceFieldDices < ActiveRecord::Migration[5.0]
  def change
    create_table :ice_field_dices do |t|
      t.string :showing_face
      t.belongs_to :ice_field_game, foreign_key: true

      t.timestamps
    end
  end
end
