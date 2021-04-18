# EEIA JAM 2021

![EEIA JAM 2021](img/eeia-jam-2021.gif)

A first place winning application created for an [EEIA JAM 2021](http://dzienweeia.samorzad.p.lodz.pl/eeia-jam.html) hackathon organized by the Faculty of Electrical, Electronic, Computer and Control Engineering on Łódź University on Technology.

## Setup

```
rails db:create
rails db:migrate
rails db:seed
```

## Endpoints

```
GET /waste_category
```
Returns each waste category in the database.

```
GET /waste_collection_point?location_category_id=8
GET /waste_collection_point
```
Returns each location with coordinates, which collects the chosen type of waste. If no arguments are provided, returns every location in the database.

```
GET /waste_category/barcode/?code=5900014003019
GET /waste_category/barcode/?name="battery"
```
Returns a suggested waste category based on an argument or an <i>unprocessable entity</i> status if arguments are incorrect or the barcode doesn't exist.<br>
**name** - a name of the product<br>
**code** - a barcode number

```
POST /waste_collection_point
{
    "name": "Location name",
    "x": "12.3",
    "y": "-1.1",
    "location_category_id": 1
}
```
Creates new waste collection point (a location collecting some type of waste).<br>
The **name** must be unique.

```
GET /location_category
```
Returns each category of the location collecting wastes. 

## Credits 

[Urszula Sołogub](https://github.com/urszulasologub) - Head backend developer<br>
[Michał Kubik](https://github.com/bopke) - Golang microservice provider<br>
[Dawid Ćwiek](https://github.com/DawidCwiek) - Ruby on Rails project configuration<br>
