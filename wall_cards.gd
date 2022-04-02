extends Node2D

func _ready():
    setup(false)

func setup(verbs: bool):
    var index : int
    if (!verbs):
        index = 0
    else:
        index = Story.operator_id_start
        
    var cards = get_children()
    
    for card in cards:
        card.setup(index)
        index += 1

func _on_OpCard_player_click(card_id):
    var verb_toggle = Story.add_word(card_id)
    setup(verb_toggle)

func _on_DoneButton_pressed():
    setup(false)
