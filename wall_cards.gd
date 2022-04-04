extends Node2D

signal card_chosen(card_id)

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
    
    emit_signal("card_chosen", card_id)
    setup(verb_toggle)

func _on_DoneButton_pressed():
    setup(false)

func _on_StoryScene_go_back(phase):
    setup(phase == Story.phase.OBJECT)
