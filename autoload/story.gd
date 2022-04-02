extends Node

var new_id: int = 0

var night: int
var boredom: int
var disbelief: int
var annoyance: int

const boredom_threshold: int = 100
const disbelief_threshold: int = 100
const annoyance_threshold: int = 100

const princess = preload("../cards/princess.gd")
const knight = preload("../cards/knight.gd")
const dragon = preload("../cards/dragon.gd")

const loves = preload("../cards/loves.gd")

var cards = {}
var memory = {}

func get_new_id():
    new_id += 1
    return new_id

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func initialise():
    night = 1
    memory = {}
    setup_cards()

func tell_story(subject_id, verb_id, object_id):
    night += 1
    
    var story_key = subject_id*10000 + verb_id*100 + object_id
    
    var repeats = memory.get(story_key, 0)
    memory[story_key] = repeats+1
    
    var subject = cards[subject_id]
    
    # handle logic based on repeats
    
    # handle logic based on story content
    
    if (threshold_exceeded()):
        Switcher.switch_scene("res://TitleScreen.tscn")

func threshold_exceeded():
    return boredom > boredom_threshold || disbelief > disbelief_threshold || annoyance > annoyance_threshold

func setup_cards():
    cards = {}
    
    setup_card(princess.new(get_new_id()))
    setup_card(knight.new(get_new_id()))
    setup_card(dragon.new(get_new_id()))
    
    setup_card(loves.new(get_new_id()))

func setup_card(card):
    cards[card.id] = card
