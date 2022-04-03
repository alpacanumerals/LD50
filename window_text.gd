extends Node2D

func _on_OpCard_player_highlight(card_id):
    var text = ""
    if card_id != null:
        text = Story.cards[card_id].card_name
    match Story.current_phase:
        Story.phase.SUBJECT:
            $SubjectLabel.text = text
        Story.phase.VERB:
            $VerbLabel.text = text
        Story.phase.OBJECT:
            $ObjectLabel.text = text
