extends Area2D

signal player_click(mouse_pos)

func _ready():
    pass # Replace with function body.

func _input(event):
    if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
        Sound.play_button_jingle()
        emit_signal("player_click", event.position)
