# EAN CONVERTER

you go like `GET /{ean code}` e.g. `GET /5900014003019` and you get `{"name":"ZATECKY SVETLY LEZAK butelka 0,5"}`

you go like `GET /{ean code that do not exist}` e.g. `GET /I_do_not_exist_lol` and you get `{"message":"No such code in database"}`

docs 10/10 would send request again