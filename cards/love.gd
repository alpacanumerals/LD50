extends Card
class_name Love

const card_name: String = "loved"
const action: bool = true

const texture: StreamTexture = preload("res://assets/asset.png")

func _init(new_id):
    id = new_id
