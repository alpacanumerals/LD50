extends Node

var night: int
var boredom: int
var disbelief: int
var annoyance: int

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func initialise():
    night = 1
    disbelief = 20
    boredom = 20
    annoyance = 20

func tell_story(boredom_effect, disbelief_effect, annoyance_effect):
    disbelief += disbelief_effect
    boredom += boredom_effect
    annoyance += annoyance_effect
    night += 1
