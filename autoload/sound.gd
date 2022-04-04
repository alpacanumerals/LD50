extends Node

var Orchestrion : AudioStreamPlayer
var Jingler : AudioStreamPlayer
var Stabber : AudioStreamPlayer
var Canceller : AudioStreamPlayer
var Mouseover : AudioStreamPlayer
var Night : AudioStreamPlayer

func _ready():
    pause_mode = Node.PAUSE_MODE_PROCESS
    setup_music()
    setup_button_jingle()
    setup_stab()
    setup_cancel()
    setup_mouseover()
    setup_night()

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

func setup_cancel():
    Canceller = AudioStreamPlayer.new()
    var cancel = load("res://assets/cancel.wav")
    add_child(Canceller)
    Canceller.set_stream(cancel)
    Canceller.volume_db = -15
    Canceller.pitch_scale = 1

func setup_mouseover():
    Mouseover = AudioStreamPlayer.new()
    var mouseover = load("res://assets/mouseover.wav")
    add_child(Mouseover)
    Mouseover.set_stream(mouseover)
    Mouseover.volume_db = -15
    Mouseover.pitch_scale = 1

func setup_night():
    Night = AudioStreamPlayer.new()
    var night = load("res://assets/jingle.wav")
    add_child(Night)
    Night.set_stream(night)
    Night.volume_db = -15
    Night.pitch_scale = 1

func play_button_jingle():
    Jingler.play()

func play_stab():
    Stabber.play()

func play_cancel():
    Canceller.play()

func play_mouseover():
    Mouseover.play()

func play_night():
    Night.play()

func set_master_volume(volume):
    if volume > 15:
        volume = 15
    if volume < -25:
        volume = -25
    AudioServer.set_bus_volume_db(
        AudioServer.get_bus_index("Master"), volume)
