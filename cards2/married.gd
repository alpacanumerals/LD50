extends Card
class_name Married

const card_name: String = "married"
const texture: StreamTexture = preload("res://assets/verb/married.png")

const action: bool = true
const adventure: bool = false
const targetanimate: bool = true

func _init(new_id):
    id = new_id
