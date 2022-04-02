extends Button

export var card_id: int

func _ready():
    pass

func _on_CardButton_pressed():
    Story.add_word(card_id)
