extends Card
class_name Loves

const card_name: String = "Loves"
const action: bool = true

const texture: StreamTexture = preload("res://assets/asset.png")

func _init(new_id):
    id = new_id
