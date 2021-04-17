# frozen_string_literal: true

class CreateWasteCollectionPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :waste_collection_points do |t|
      t.string :name, unique: true, null: false
      t.string :x, null: false
      t.string :y, null: false
      t.timestamps
    end

    add_reference :waste_collection_points, :waste_category, index: true
  end
end
