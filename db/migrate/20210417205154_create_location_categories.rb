# frozen_string_literal: true

class CreateLocationCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :location_categories do |t|
      t.string :name, unique: true, null: false
      t.string :description
      t.timestamps
    end
  end

  add_reference :waste_collection_points, :location_category, index: true
end
