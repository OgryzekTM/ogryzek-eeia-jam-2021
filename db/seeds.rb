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
  'gazeta',
  'czasopismo',
  'ulotka',
  'zeszyt'
].each do |name|
  category = WasteCategory.find_by(name: 'Papier')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'owoce',
  'jabłko',
  'gruszka',
  'banan',
  'winogrona',
  'brzoskwinia',
  'ananas',
  'warzywo',
  'ziemniak',
  'kartofel',
  'herbata',
  'kawa',
  'kwiat',
  'brokuł',
  'ogórek',
  'pomidor'
].each do |name|
  category = WasteCategory.find_by(name: 'Bioodpady')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'puszka',
  'metal',
  'plastik',
  'zakrętka',
  'tetrapak',
  'sok',
  'śruba',
  'gwóźdź',
  'napój',
  'piwo',
  'alkohol'
].each do |name|
  category = WasteCategory.find_by(name: 'Metale i tworzywa sztuczne')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'szafa',
  'stół',
  'komoda',
  'meblościanka',
  'wersalka',
  'fotel'
].each do |name|
  category = WasteCategory.find_by(name: 'Gabaryty')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'słój',
  'słoik',
  'szklany',
  'kosmetyk',
  'alkohol',
  'butelka'
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
  'ibuprom',
  'apap'
].each do |name|
  category = WasteCategory.find_by(name: 'Leki')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'bateria',
  'AA',
  'AAA',
  'akumulator'
].each do |name|
  category = WasteCategory.find_by(name: 'Baterie i akumulatory')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

[
  'farba',
  'tynk',
  'gips'
].each do |name|
  category = WasteCategory.find_by(name: 'Odpady remontowe i inne')
  WasteKeyword.find_or_create_by(name: name, waste_category_id: category&.id)
end

WasteCollectionPoint.find_or_create_by(
  name: 'Skup złomu',
  x: '12.3',
  y: '-99.1',
  waste_category: WasteCategory.find_by(name: 'Elektrośmieci')
)
