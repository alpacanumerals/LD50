extends Area2D

var id : int

signal player_click(card_id)

func _ready():
    pass

func setup(card_id):
    var card = Story.cards[card_id]
    id = card.id
    $Sprite.set_texture(card.texture)

func _on_OpCard_input_event(viewport, event, shape_idx):
    print("foo")
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
        Sound.play_button_jingle()
        emit_signal("player_click", id)


func _on_OpCard_mouse_entered():
    print("foo")
    pass # Replace with function body.
