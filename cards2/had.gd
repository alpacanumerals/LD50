extends Card
class_name Had

const card_name: String = "had"
const texture: StreamTexture = preload("res://assets/verb/had.png")

const action: bool = false
const adventure: bool = false

func _init(new_id):
    id = new_id
