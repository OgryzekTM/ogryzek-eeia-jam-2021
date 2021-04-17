# frozen_string_literal: true

[
  'Zmieszane',
  'Papier',
  'Bioodpady',
  'Metale i tworzywa sztuczne',
  'Gabaryty',
  'Szkło',
  'Zielone',
  'Odpady zmieszane',
  'Elektrośmieci',
  'Leki',
  'Baterie i akumulatory',
  'PSZOK',
  'Odpady remontowe i inne',
  'Odpady do indywidualnego przekazania uprawnionej firmie'
].each do |name|
  WasteCategory.find_or_create_by(name: name)
end

[
  'Papier',
 'Chusteczki'
].each do |name|
  category = WasteCategory.find_by(name: 'Papier')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

WasteCollectionPoint.find_or_create_by(name: 'Test', x: '12.3', y: '-99.1', waste_category: WasteCategory.first)
