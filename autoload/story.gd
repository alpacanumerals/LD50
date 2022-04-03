extends Node

var new_id: int = 0

var operator_id_start: int

var night: int
var boredom: int
var annoyance: int

const boredom_threshold: int = 10
const annoyance_threshold: int = 10

const castle = preload("res://cards/castle.gd")
const cat = preload("res://cards/cat.gd")
const cavern = preload("res://cards/cavern.gd")
const dragon = preload("res://cards/dragon.gd")
const fox = preload("res://cards/fox.gd")
const giant = preload("res://cards/giant.gd")
const king = preload("res://cards/king.gd")
const knight = preload("res://cards/knight.gd")
const labyrinth = preload("res://cards/labyrinth.gd")
const magic = preload("res://cards/magic.gd")
const peddler = preload("res://cards/peddler.gd")
const prince = preload("res://cards/prince.gd")
const princess = preload("res://cards/princess.gd")
const queen = preload("res://cards/queen.gd")
const sword = preload("res://cards/sword.gd")
const tower = preload("res://cards/tower.gd")
const twin = preload("res://cards/twin.gd")
const witch = preload("res://cards/witch.gd")

const burned = preload("res://cards2/burned.gd")
const climbed = preload("res://cards2/climbed.gd")
const despised = preload("res://cards2/despised.gd")
const fell_upon = preload("res://cards2/fell_upon.gd")
const found = preload("res://cards2/found.gd")
const had = preload("res://cards2/had.gd")
const loved = preload("res://cards2/loved.gd")
const married = preload("res://cards2/married.gd")
const pursued = preload("res://cards2/pursued.gd")
const revived = preload("res://cards2/revived.gd")
const rewarded = preload("res://cards2/rewarded.gd")
const slew = preload("res://cards2/slew.gd")
const spoke_with = preload("res://cards2/spoke_with.gd")
const stole = preload("res://cards2/stole.gd")
const struck = preload("res://cards2/struck.gd")
const threw = preload("res://cards2/threw.gd")
const turned_into = preload("res://cards2/turned_into.gd")
const visited = preload("res://cards2/visited.gd")

var cards = {}

var memory = {}

enum phase { SUBJECT, VERB, OBJECT, NONE }
var current_phase: int = phase.SUBJECT
var current_tale = {}


var repeats: int = 0
var offense: int = 0

func get_new_id():
    var id = new_id
    new_id += 1
    return id

func _ready():
    pass

func initialise():
    new_id = 0
    night = 1
    boredom = 0
    annoyance = 0
    memory = {}
    setup_cards()
    current_phase = phase.SUBJECT
    current_tale = {}

func tell_story(subject_id, verb_id, object_id):
    repeats = 0
    offense = 0
    
    var story_key = subject_id*10000 + verb_id*100 + object_id
    
    repeats = memory.get(story_key, 0)
    memory[story_key] = repeats+1
    
    var subject = cards[subject_id]
    var object = cards[object_id]
    
    var verb = cards[verb_id]
    
    print("key: " + str(story_key))
    
    # handle logic based on repeats
    boredom += repeats
    
    # handle logic based on story content
    offense = Storyrules.ponder(subject, object, verb)     
    annoyance += offense
    
    print("boredom: " + str(boredom))
    print("annoyance: " + str(annoyance))
    
    return threshold_exceeded()

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
    setup_card(castle.new(get_new_id()))
    setup_card(cat.new(get_new_id()))
    setup_card(cavern.new(get_new_id()))
    setup_card(dragon.new(get_new_id()))
    setup_card(fox.new(get_new_id()))
    setup_card(giant.new(get_new_id()))
    setup_card(king.new(get_new_id()))
    setup_card(knight.new(get_new_id()))
    setup_card(labyrinth.new(get_new_id()))
    setup_card(magic.new(get_new_id()))
    setup_card(peddler.new(get_new_id()))
    setup_card(prince.new(get_new_id()))
    setup_card(princess.new(get_new_id()))
    setup_card(queen.new(get_new_id()))
    setup_card(sword.new(get_new_id()))
    setup_card(tower.new(get_new_id()))
    setup_card(twin.new(get_new_id()))
    setup_card(witch.new(get_new_id()))

    operator_id_start = new_id
    
    setup_card(burned.new(get_new_id()))
    setup_card(climbed.new(get_new_id()))
    setup_card(despised.new(get_new_id()))
    setup_card(fell_upon.new(get_new_id()))
    setup_card(found.new(get_new_id()))
    setup_card(had.new(get_new_id()))
    setup_card(loved.new(get_new_id()))
    setup_card(married.new(get_new_id()))
    setup_card(pursued.new(get_new_id()))
    setup_card(revived.new(get_new_id()))
    setup_card(rewarded.new(get_new_id()))
    setup_card(slew.new(get_new_id()))
    setup_card(spoke_with.new(get_new_id()))
    setup_card(stole.new(get_new_id()))
    setup_card(struck.new(get_new_id()))
    setup_card(threw.new(get_new_id()))
    setup_card(turned_into.new(get_new_id()))
    setup_card(visited.new(get_new_id()))

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
    return current_phase == phase.VERB
