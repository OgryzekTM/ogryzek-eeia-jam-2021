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