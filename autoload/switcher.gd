extends Node

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS

func switch_scene(path):
    yield(get_tree().create_timer(0.15), "timeout")
    get_tree().change_scene(path)
