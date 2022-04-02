extends Card
class_name Reward

const card_name: String = "rewarded"
const action: bool = true

const texture: StreamTexture = preload("res://assets/asset.png")

func _init(new_id):
    id = new_id
