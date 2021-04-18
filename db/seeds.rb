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
  'Ubrania',
  'Książki',
  'Okulary',
  'Jedzenie długoterminowe',
  'Zabawki'
].each do |name|
  LocationCategory.find_or_create_by(name: name)
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
  'alkohol',
  'czipsy',
  'chipsy',
  'aluminium'
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

WasteCategory.all.pluck(:name).each do |waste_category_name|
  LocationCategory.find_or_create_by(name: waste_category_name)
end

WasteCollectionPoint.find_or_create_by(
  name: 'Zatoka Sportu Politechniki Łódzkiej',
  x: '51.74627549993444',
  y: '19.452312615511207',
  location_category: LocationCategory.find_by(name: 'Zmieszane')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Przetwórnia nawozów',
  x: '51.752220975062436',
  y: '19.42542669193397',
  location_category: LocationCategory.find_by(name: 'Zmieszane')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Zbiór manufaktury',
  x: '51.76430913647177',
  y: '19.47533804688789',
  location_category: LocationCategory.find_by(name: 'Papier')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Przetwórnia nawozów',
  x: '51.752220975062436',
  y: '19.42542669193397',
  location_category: LocationCategory.find_by(name: 'Bioodpady')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Dom Dziecka nr 14',
  x: '51.76525089378851',
  y: '19.450070746223037',
  location_category: LocationCategory.find_by(name: 'Zabawki')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Dom Dziecka nr 14',
  x: '51.76525089378851',
  y: '19.450070746223037',
  location_category: LocationCategory.find_by(name: 'Jedzenie długoterminowe')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Łódzki Oddział Czerwonego Krzyża',
  x: '51.762919485527604',
  y: '19.47879992174048',
  location_category: LocationCategory.find_by(name: 'Ubrania')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Kontener PCK na Manhattanie, Piotrkowska 210',
  x: '51.7577694631309',
  y: '19.460599832132417',
  location_category: LocationCategory.find_by(name: 'Ubrania')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Skup Złomu Wojtek',
  x: '51.77221643063697',
  y: '19.449990977754766',
  location_category: LocationCategory.find_by(name: 'Metale i tworzywa sztuczne')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Zatoka Sportu Politechniki Łódzkiej',
  x: '51.74627549993444',
  y: '19.452312615511207',
  location_category: LocationCategory.find_by(name: 'Metale i tworzywa sztuczne')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Przetwórnia nawozów',
  x: '51.752220975062436',
  y: '19.42542669193397',
  location_category: LocationCategory.find_by(name: 'Metale i tworzywa sztuczne')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Skup mebli',
  x: '51.76453291048675',
  y: '19.495147014049568',
  location_category: LocationCategory.find_by(name: 'Gabaryty')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Piotrkowska 83, lokal 15 w bramie',
  x: '51.76776573050785',
  y: '19.455005799144068',
  location_category: LocationCategory.find_by(name: 'Szkło')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Wytwory szklarniane Widzew',
  x: '51.77597281163459',
  y: '19.497338459192733',
  location_category: LocationCategory.find_by(name: 'Szkło')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Zoo w Łodzi, skupimy paszę dla zwierząt',
  x: '51.76607915913768',
  y: '19.41158302767784',
  location_category: LocationCategory.find_by(name: 'Zielone')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Skup Złomu Wojtek',
  x: '51.77221643063697',
  y: '19.449990977754766',
  location_category: LocationCategory.find_by(name: 'Elektrośmieci')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Serwis laptopów Notebook',
  x: '51.77383686569209',
  y: '19.439925924534453',
  location_category: LocationCategory.find_by(name: 'Elektrośmieci')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Warsztat samochodowy Autko',
  x: '51.74853508120879',
  y: '19.46917724757238',
  location_category: LocationCategory.find_by(name: 'Elektrośmieci')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Wydział Elektrotechniki, Elektroniki, Informatyki i Automatyki Politechniki Łódzkiej',
  x: '51.75384764021104',
  y: '19.451914437887663',
  location_category: LocationCategory.find_by(name: 'Elektrośmieci')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Apteka całodobowa Rosa',
  x: '51.75306358014886',
  y: '19.4555622156467',
  location_category: LocationCategory.find_by(name: 'Leki')
)

WasteCollectionPoint.find_or_create_by(
  name: 'DOZ Apteka dbam o zdrowie',
  x: '51.75630461678671',
  y: '19.458523374161437',
  location_category: LocationCategory.find_by(name: 'Leki')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Kaufland Wróblewskiego',
  x: '51.74543633743289',
  y: '19.438479747986342',
  location_category: LocationCategory.find_by(name: 'Baterie i akumulatory')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Kaufland Kilińskiego',
  x: '51.73675226340338',
  y: '19.480928228724142',
  location_category: LocationCategory.find_by(name: 'Baterie i akumulatory')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Jesion Inwestycje Budowlane',
  x: '51.75333030711077',
  y: '19.477494996556473',
  location_category: LocationCategory.find_by(name: 'Odpady remontowe i inne')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Księgarnia Book się rodzi',
  x: '51.76414516113175',
  y: '19.45788828461747',
  location_category: LocationCategory.find_by(name: 'Książki')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Butik Aurum Optics - Optyk i Okulista - Łódź',
  x: '51.763633831663626',
  y: '19.457351842781954',
  location_category: LocationCategory.find_by(name: 'Okulary')
)

WasteCollectionPoint.find_or_create_by(
  name: 'OkoPharma - Do zobaczenia',
  x: '51.763705338072405',
  y: '19.45738719069624',
  location_category: LocationCategory.find_by(name: 'Okulary')
)

WasteCollectionPoint.find_or_create_by(
  name: 'Przetwórnia nawozów',
  x: '51.752220975062436',
  y: '19.42542669193397',
  location_category: LocationCategory.find_by(name: 'Ubrania')
)
