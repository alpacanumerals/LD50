extends Node

var Orchestrion

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

func setup_music():
    pause_mode = Node.PAUSE_MODE_PROCESS
    Orchestrion = AudioStreamPlayer.new()
    var music = load("res://assets/amusic.mp3")
    yield(get_tree().create_timer(0.5), "timeout")
    add_child(Orchestrion)
    Orchestrion.set_stream(music)
    Orchestrion.volume_db = 0
    Orchestrion.pitch_scale = 1
    Orchestrion.play()
    
func master_volume_up():
    var volume = AudioServer.get_bus_volume_db(
        AudioServer.get_bus_index("Master"))
    if (volume < 10):
        volume = volume + 1
    print (volume)
    AudioServer.set_bus_volume_db(
        AudioServer.get_bus_index("Master"), volume)
    pass

func master_volume_down():
    var volume = AudioServer.get_bus_volume_db(
    AudioServer.get_bus_index("Master"))
    if (volume > -10):
        volume = volume - 1
    print (volume)
    AudioServer.set_bus_volume_db(
        AudioServer.get_bus_index("Master"), volume)
    pass
