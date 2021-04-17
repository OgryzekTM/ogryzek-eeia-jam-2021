# frozen_string_literal: true

class WasteCategoryService
  def initialize(waste_product_hash)
    @data = waste_product_hash
    @keywords = [@data['name']]
    @data['categoryDetails']&.pluck('text')&.each do |details|
      @keywords.append(details)
    end
  end

  def determine
    default_category = WasteCategory.first
    calculations = {
      min_levenshtein: 4,
      category: default_category
    }
    @keywords.each do |keyword|
      WasteKeyword.all.each do |key|
        calc_min = Levenshtein.distance(key.name, keyword)
        if calc_min < calculations[:min_levenshtein]
          calculations[:min_levenshtein] = calc_min
          calculations[:category] = key.waste_category
        end
      end
    end
    {
      category: calculations[:category],
      product: @data['name']
    }
  end
end
