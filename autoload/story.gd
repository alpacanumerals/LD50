extends Node

var new_id: int = 0

var operator_id_start: int

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

enum phase { SUBJECT, VERB, OBJECT, NONE }
var current_phase: int = phase.SUBJECT
var current_tale = {}

func get_new_id():
    var id = new_id
    new_id += 1
    return id

func _ready():
    pass

func initialise():
    night = 1
    boredom = 0
    annoyance = 0
    memory = {}
    setup_cards()
    current_phase = phase.SUBJECT
    current_tale = {}

func tell_story(subject_id, verb_id, object_id):
    var story_key = subject_id*10000 + verb_id*100 + object_id
    
    var repeats = memory.get(story_key, 0)
    memory[story_key] = repeats+1
    
    var subject = cards[subject_id]
    var object = cards[object_id]
    
    var verb = cards[verb_id]
    
    print("key: " + str(story_key))
    
    # handle logic based on repeats
    if (repeats <= 0):
        print("how interesting")
    else:
        print("didn't that aready happen?")
        boredom += repeats
    
    # handle logic based on story content
    if (verb is Loves):
        if (subject.female == true
        && subject.monster == false
        && object.monster == true):
            print("a maiden would never love a monster")
            annoyance += 1
    else:
        print("makes sense")
    
    print("boredom: " + str(boredom))
    print("annoyance: " + str(annoyance))
    
    next_night()
    
    if (threshold_exceeded()):
        Switcher.switch_scene("res://TitleScreen.tscn")

func next_night():
    night += 1
    current_tale = {}
    current_phase = phase.SUBJECT

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
    
    operator_id_start = new_id
    setup_card(loves.new(get_new_id()))

func setup_card(card):
    cards[card.id] = card
    
func add_word(card_id):
    current_tale[current_phase] = card_id
    if current_phase == phase.SUBJECT:
        current_phase = phase.VERB
    elif current_phase == phase.VERB:
        current_phase = phase.OBJECT
    elif current_phase == phase.OBJECT:
        current_phase = phase.NONE
