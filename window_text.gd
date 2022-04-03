extends Node2D

func _on_OpCard_player_highlight(card_id):
    var text = Story.cards[card_id].card_name
    update_text(text)

func _on_blank_walls_mouse_entered():
    update_text("")
    
func update_text(text):
    match Story.current_phase:
        Story.phase.SUBJECT:
            $SubjectLabel.text = text
        Story.phase.VERB:
            $VerbLabel.text = text
        Story.phase.OBJECT:
            $ObjectLabel.text = text
