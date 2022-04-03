extends Card
class_name Threw

const card_name: String = "threw"
const texture: StreamTexture = preload("res://assets/verb/threw.png")

const action: bool = true
const adventure: bool = true

func _init(new_id):
    id = new_id
