extends Node

var new_id: int = -1

var night: int
var boredom: int
var annoyance: int

const boredom_threshold: int = 10
const annoyance_threshold: int = 10

const princess = preload("res://cards/princess.gd")
const knight = preload("res://cards/knight.gd")
const dragon = preload("res://cards/dragon.gd")

const loves = preload("res://cards/loves.gd")

var cards = {}
var memory = {}

func get_new_id():
    new_id += 1
    return new_id

func _ready():
    pass

func initialise():
    night = 1
    boredom = 0
    annoyance = 0
    memory = {}
    setup_cards()

func tell_story(subject_id, verb_id, object_id):
    night += 1
    
    var story_key = subject_id*10000 + verb_id*100 + object_id
    
    var repeats = memory.get(story_key, 0)
    memory[story_key] = repeats+1
    
    var subject = cards[subject_id]
    
    print("key: " + str(story_key))
    
    # handle logic based on repeats
    if (repeats <= 0):
        print("how interesting")
    else:
        print("didn't that aready happen?")
        boredom += repeats
    
    # handle logic based on story content
    if (cards[verb_id] is Loves):
        if (cards[subject_id].female == true
        && cards[subject_id].monster == false
        && cards[object_id].monster == true):
            print("a maiden would never love a monster")
            annoyance += 1
    else:
        print("makes sense")
    
    print("boredom: " + str(boredom))
    print("annoyance: " + str(annoyance))
    
    if (threshold_exceeded()):
        Switcher.switch_scene("res://TitleScreen.tscn")

func threshold_exceeded():
    var exceeded: bool = false
    if (boredom > boredom_threshold):
        print("this is too boring!")
        exceeded = true
    if (annoyance > annoyance_threshold):
        print("this is too silly!")
        exceeded = true
    return exceeded

func setup_cards():
    cards = {}
    
    setup_card(princess.new(get_new_id()))
    setup_card(knight.new(get_new_id()))
    setup_card(dragon.new(get_new_id()))
    
    setup_card(loves.new(get_new_id()))

func setup_card(card):
    cards[card.id] = card
