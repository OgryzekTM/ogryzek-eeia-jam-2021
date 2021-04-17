# frozen_string_literal: true

class CreateWasteProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :waste_products do |t|
      t.string :name
      t.string :description
      t.string :barcode

      t.timestamps
    end

    add_reference :waste_categories, :waste_product, index: true
  end
end
