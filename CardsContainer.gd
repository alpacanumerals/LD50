extends HBoxContainer

export var verbs: bool = false
const card_button = preload("res://CardButton.tscn")

func _ready():
    if (verbs):
        for i in range(Story.operator_id_start, Story.new_id):
            var cb = card_button.instance()
            cb.card_id = Story.cards[i].id
            cb.text = Story.cards[i].card_name
            add_child(cb)
    else:
        for i in range(0, Story.operator_id_start):
            var cb = card_button.instance()
            cb.card_id = Story.cards[i].id
            cb.text = Story.cards[i].card_name
            add_child(cb)
        
func _process(_delta):
    visible = Story.current_phase != Story.phase.NONE && verbs == (Story.current_phase == Story.phase.VERB)
