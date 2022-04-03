extends Node2D

func _on_OpCard_player_highlight(card_id):
    update_text_by_card_id(card_id)

func _on_blank_walls_mouse_entered():
    update_text("")

func _on_WallCards_card_chosen(card_id):
    if (Story.current_phase == Story.phase.VERB):
        card_id += Story.operator_id_start
    elif (Story.current_phase == Story.phase.OBJECT):
        card_id -= Story.operator_id_start
    update_text_by_card_id(card_id)

func _on_NightArea_night_over():
    blank_text()

func _on_NightArea_game_over():
    blank_text()

func update_text_by_card_id(card_id):
    var text = Story.cards[card_id].card_name
    update_text(text)

func update_text(text):
    match Story.current_phase:
        Story.phase.SUBJECT:
            $SubjectLabel.text = text
        Story.phase.VERB:
            $VerbLabel.text = text
        Story.phase.OBJECT:
            $ObjectLabel.text = text

func blank_text():
    $SubjectLabel.text = ""
    $VerbLabel.text = ""
    $ObjectLabel.text = ""

