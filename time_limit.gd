extends HBoxContainer

var max_time : int
var time_remaining: float

var running : bool

signal time_up

func _ready():
    max_time = 7
    time_remaining = max_time
    running = false
    
func reset():
    if (max_time > 7):
        max_time -= 1
    time_remaining = max_time
    running = true
    $TimeBar.max_value = max_time
    $TimeBar.value = time_remaining
    
func _process(delta):
    #time_remaining -= delta
    if (time_remaining < 0):
        time_remaining = 0
    $TimeBar.value = time_remaining
    if (time_remaining == 0):
        running = false
        emit_signal("time_up")
