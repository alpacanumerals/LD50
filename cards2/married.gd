extends Card
class_name Married

const card_name: String = "married"
const texture: StreamTexture = preload("res://assets/verb/married.png")

const action: bool = true
const adventure: bool = false

func _init(new_id):
    id = new_id
