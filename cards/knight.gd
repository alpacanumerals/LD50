extends Card
class_name Knight

const card_name: String = "Knight"
const female: bool = false
const monster: bool = false
const noble: bool = true
const animate: bool = true

const texture: StreamTexture = preload("res://assets/asset.png")

func _init(new_id):
    id = new_id
