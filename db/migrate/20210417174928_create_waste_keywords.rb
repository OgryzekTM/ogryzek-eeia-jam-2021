# frozen_string_literal: true

class CreateWasteKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :waste_keywords do |t|
      t.string :name, unique: true, null: false
    end

    add_reference :waste_keywords, :waste_category, index: true
  end
end
