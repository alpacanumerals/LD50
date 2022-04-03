extends Area2D

var id : int

signal player_click(card_id)
signal player_highlight(card_id)

func setup(card_id):
    $Highlight.visible = false
    var card = Story.cards[card_id]
    id = card.id
    $Sprite.set_texture(card.texture)

func _on_OpCard_input_event(_viewport, event, _shape_idx):
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
        Sound.play_button_jingle()
        emit_signal("player_click", id)

func _on_OpCard_mouse_entered():
    $Highlight.visible = true
    emit_signal("player_highlight", id)

func _on_OpCard_mouse_exited():
    $Highlight.visible = false

func _process(_delta):
    if (Story.current_phase == Story.phase.NONE):
        visible = false
    else:
        visible = true
