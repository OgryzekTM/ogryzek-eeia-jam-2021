# frozen_string_literal: true

[
  'Zmieszane',
  'Papier',
  'Bioodpady',
  'Metale i tworzywa sztuczne',
  'Gabaryty',
  'Szkło',
  'Zielone',
  'Elektrośmieci',
  'Leki',
  'Baterie i akumulatory',
  'Odpady remontowe i inne',
].each do |name|
  WasteCategory.find_or_create_by(name: name)
end

[
  'Papier',
  'Chusteczki',
  'karton',
  ''
].each do |name|
  category = WasteCategory.find_by(name: 'Papier')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'owoce'
].each do |name|
  category = WasteCategory.find_by(name: 'Bioodpady')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'puszka',
  'metal',
  'plastik',
  
].each do |name|
  category = WasteCategory.find_by(name: 'Metale i tworzywa sztuczne')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'szafa',
  '',
].each do |name|
  category = WasteCategory.find_by(name: 'Gabaryty')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'słój',
  'słoik',
  'szklany'
].each do |name|
  category = WasteCategory.find_by(name: 'Szkło')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'liście',
  'patyki',
  'trawa'
].each do |name|
  category = WasteCategory.find_by(name: 'Zielone')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'komputer',
  'telewizor',
  'pralka',
  'mikrofalówka',
  'lodówka'
].each do |name|
  category = WasteCategory.find_by(name: 'Elektrośmieci')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'xanax',
  'rutinoscorbin',
  'ibuprom'
].each do |name|
  category = WasteCategory.find_by(name: 'Leki')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'baterie',
  'AA',
  'AAA'
].each do |name|
  category = WasteCategory.find_by(name: 'Baterie i akumulatory')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  ''
].each do |name|
  category = WasteCategory.find_by(name: 'Odpady remontowe i inne')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end
