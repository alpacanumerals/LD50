extends HBoxContainer

var max_time: int
var time_remaining: float

var tutorial: bool
var running: bool

signal time_up

func _ready():
    max_time = Options.max_time + 1
    time_remaining = max_time
    running = false
    tutorial = Options.tutorial
    reset()
    
func reset():
    if !tutorial:
        if max_time > Options.min_time:
            max_time -= 1
        running = true
        time_remaining = max_time
    
    tutorial = false
    $TimeBar.max_value = max_time
    $TimeBar.value = time_remaining
    
func _process(delta):
    if running:
        time_remaining -= delta
    if time_remaining < 0:
        time_remaining = 0
    $TimeBar.value = time_remaining
    if time_remaining == 0 && running:
        running = false
        emit_signal("time_up")

func _on_DoneButton_pressed():
    running = false

func _on_NightArea_night_over():
    reset()
