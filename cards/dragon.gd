extends Card
class_name Dragon

const card_name: String = "Dragon"
const female: bool = false
const monster: bool = true
const noble: bool = false
const animate: bool = true
const structure: bool = false

var dead: bool = false
var aflame: bool = false

const texture: StreamTexture = preload("res://assets/noun/dragon.png")

func _init(new_id):
    dead = false
    aflame = false
    id = new_id
