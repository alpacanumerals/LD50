extends HBoxContainer

var max_time : int
var time_remaining: float

var running : bool

signal time_up

func _ready():
    max_time = 20
    time_remaining = max_time
    running = false
    reset()
    
func reset():
    if (max_time > 7):
        max_time -= 1
    time_remaining = max_time
    $TimeBar.max_value = max_time
    $TimeBar.value = time_remaining
    running = true
    
func _process(delta):
    if (running && Story.night > 1):
        time_remaining -= delta
    if (time_remaining < 0):
        time_remaining = 0
    $TimeBar.value = time_remaining
    if (time_remaining == 0 && running):
        running = false
        emit_signal("time_up")

func _on_DoneButton_pressed():
    running = false

func _on_NightArea_night_over():
    reset()
