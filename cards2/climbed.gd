extends Card
class_name Climbed

const card_name: String = "climbed"
const texture: StreamTexture = preload("res://assets/verb/climbed.png")

const action: bool = true
const adventure: bool = true

func _init(new_id):
    id = new_id
