extends Node

var Orchestrion : AudioStreamPlayer
var Jingler : AudioStreamPlayer
var Stabber : AudioStreamPlayer

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    setup_music()
    setup_button_jingle()
    setup_stab()

func setup_music():
    Orchestrion = AudioStreamPlayer.new()
    var music = load("res://assets/inevnite.mp3")
    yield(get_tree().create_timer(0.5), "timeout")
    add_child(Orchestrion)
    Orchestrion.set_stream(music)
    Orchestrion.volume_db = 0
    Orchestrion.pitch_scale = 1
    Orchestrion.play()
    
func setup_button_jingle():
    Jingler = AudioStreamPlayer.new()
    var jingle = load("res://assets/select.wav")
    add_child(Jingler)
    Jingler.set_stream(jingle)
    Jingler.volume_db = -15
    Jingler.pitch_scale = 1
    
func setup_stab():
    Stabber = AudioStreamPlayer.new()
    var stab = load("res://assets/stab.wav")
    add_child(Stabber)
    Stabber.set_stream(stab)
    Stabber.volume_db = -15
    Stabber.pitch_scale = 1

func play_button_jingle():
    Jingler.play()

func play_stab():
    Stabber.play()

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
