# frozen_string_literal: true

class CreateWasteCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :waste_categories do |t|
      t.string :name, unique: true, null: false
      t.string :description
      t.timestamps
    end
  end
end
