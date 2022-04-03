extends Card
class_name Stole

const card_name: String = "stole"
const texture: StreamTexture = preload("res://assets/verb/stole.png")

const action: bool = true
const adventure: bool = true
const targetanimate: bool = false

func _init(new_id):
    id = new_id
