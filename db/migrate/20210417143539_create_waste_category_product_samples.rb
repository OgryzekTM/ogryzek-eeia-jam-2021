# frozen_string_literal: true

class CreateWasteCategoryProductSamples < ActiveRecord::Migration[6.1]
  def change
    create_table :waste_category_product_samples do |t|
      t.string :name
      t.timestamps
    end

    add_reference :waste_category_product_samples, :waste_category, index: true
  end
end
