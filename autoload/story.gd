extends Node

var night: int
var boredom: int
var disbelief: int
var annoyance: int

const boredom_threshold: int = 100
const disbelief_threshold: int = 100
const annoyance_threshold: int = 100

var memory = {}

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func initialise():
    night = 1
    memory = {}

func tell_story(subject_id, verb_id, object_id):
    night += 1
    
    var story_key = subject_id * 10000 + verb_id * 100 + object_id
    
    var repeats = memory.get(story_key, 0)
    memory.set(story_key, repeats+1)
    
    # handle logic based on repeats
    
    # handle logic based on story content
    
    if (threshold_exceeded()):
        Switcher.switch_scene("res://TitleScreen.tscn")

func threshold_exceeded():
    return boredom > boredom_threshold || disbelief > disbelief_threshold || annoyance > annoyance_threshold
