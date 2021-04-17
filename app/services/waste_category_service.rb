# frozen_string_literal: true

class WasteCategoryService
  def initialize(waste_product_hash)
    @data = waste_product_hash
    @keywords = [@data['name']]
    @data['categoryDetails'].pluck('text').each do |details|
      @keywords.append(details)
    end
  end

  def determine
    default_category = WasteCategory.first
    calculations = {
      min_levenshtein: 2,
      category: default_category
    }
    @keywords.each do |keyword|
      categories = WasteCategory.all.sort do |a, b|
        Levenshtein.distance(a.name, keyword) <=> Levenshtein.distance(b.name, keyword)
      end
      calc_min = Levenshtein.distance(categories.first.name, keyword)
      next unless calc_min < calculations[:min_levenshtein]

      calculations = {
        min_levenshtein: calc_min,
        category: categories.first
      }
    end
    calculations[:category]
  end
end
