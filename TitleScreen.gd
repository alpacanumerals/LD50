extends MarginContainer

func _ready():
    Sound.setup_music()
    initialise_game_values()

func initialise_game_values():
    pass

func _on_VolumeUp_pressed():
    Sound.master_volume_up()

func _on_VolumeDown_pressed():
    Sound.master_volume_down()

#foo
#foo

#foo x 3
