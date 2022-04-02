extends Card
class_name Dragon

const card_name: String = "Dragon"
const female: bool = false
const monster: bool = true
const noble: bool = false
const animate: bool = true

const texture: StreamTexture = preload("res://assets/asset.png")

func _init(new_id):
    id = new_id
