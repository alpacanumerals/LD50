extends HBoxContainer

export var verbs: bool = false
const card_button = preload("res://CardButton.tscn")

func _ready():
    if (!verbs):
        for i in range(0, Story.operator_id_start):
            var cb = card_button.instance()
            cb.card_id = Story.operands[i].id
            cb.text = Story.operands[i].card_name
            add_child(cb)
    else:
        for i in range(Story.operator_id_start, Story.new_id):
            var cb = card_button.instance()
            cb.card_id = Story.operators[i].id
            cb.text = Story.operators[i].card_name
            add_child(cb)
