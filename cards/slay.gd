extends Card
class_name Slay

const card_name: String = "slayed"
const action: bool = true

const texture: StreamTexture = preload("res://assets/asset.png")

func _init(new_id):
    id = new_id
