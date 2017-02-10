class CreateAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :place
      t.belongs_to :ice_field_game, foreign_key: true
      t.timestamps
    end
  end
end
