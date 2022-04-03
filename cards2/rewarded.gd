extends Card
class_name Rewarded

const card_name: String = "rewarded"
const texture: StreamTexture = preload("res://assets/verb/rewarded.png")

const action: bool = true
const adventure: bool = false
const targetanimate: bool = true

func _init(new_id):
    id = new_id
