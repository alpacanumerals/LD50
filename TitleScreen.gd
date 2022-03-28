extends MarginContainer

func _ready():
    Sound.setup_sounds()
    initialise_game_values()

func initialise_game_values():
    pass

func _on_VolumeUp_pressed():
    Sound.play_button_jingle()
    Sound.master_volume_up()

func _on_VolumeDown_pressed():
    Sound.play_button_jingle()
    Sound.master_volume_down()

func _on_StartButton_pressed():
    Sound.play_button_jingle()

func _on_OptionsButton_pressed():
    Sound.play_button_jingle()
