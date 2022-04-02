extends Node

var night: int
var boredom: int
var disbelief: int
var annoyance: int

const boredom_threshold: int = 100
const disbelief_threshold: int = 100
const annoyance_threshold: int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func initialise():
    night = 1
    disbelief = 20
    boredom = 20
    annoyance = 20

func tell_story(boredom_effect, disbelief_effect, annoyance_effect):
    boredom += boredom_effect
    disbelief += disbelief_effect
    annoyance += annoyance_effect
    night += 1

    bound_values()
    
    if (threshold_exceeded()):
        Switcher.switch_scene("res://TitleScreen.tscn")

func threshold_exceeded():
    return boredom > boredom_threshold || disbelief > disbelief_threshold || annoyance > annoyance_threshold

func bound_values():
    if (boredom < 0):
        boredom = 0
    if (disbelief < 0):
        disbelief = 0
    if (annoyance < 0):
        annoyance = 0
