extends Area2D

enum stages { START, STORY, SULTAN, MOOD, END, STAB }
var stage : int

const story_format = "Scheherazade: The %s %s the %s"

signal night_over

func _ready():
    $NightSprite.modulate.a = 0
    $NightSprite.visible = false
    set_process_input(false)

func initialise():
    blank_text()
    stage = stages.START

func night_fall():
    initialise()
    $NightSprite.visible = true
    $Dusk.interpolate_property($NightSprite,
        "modulate",
        Color(0, 0, 0, 0),
        Color(0, 0, 0, 1),
        1.5)
    $Dusk.start()
    set_process_input(true)
    
func dawn_break():
    $Dawn.interpolate_property($NightSprite,
        "modulate",
        Color(0, 0, 0, 1),
        Color(0, 0, 0, 0),
        1.5)
    $Dawn.start()
    blank_text()
    Story.next_night()
    set_process_input(false)

func _input(event):
    if (event.is_pressed()):
        match stage:
            stages.START:
                $StoryText.text = compose_story_text()
                stage = stages.STORY
            stages.STORY:
                $SultanText.text = compose_sultan_text()
                stage = stages.MOOD
            stages.MOOD:
                $SultanMood.text = compose_sultan_mood()
                stage = stages.END
            stages.END:
                emit_signal("night_over")
                dawn_break()
    get_tree().set_input_as_handled()

func compose_story_text():
    var subject = Story.cards[Story.current_tale[Story.phase.SUBJECT]].card_name
    var verb = Story.cards[Story.current_tale[Story.phase.VERB]].card_name
    var object = Story.cards[Story.current_tale[Story.phase.OBJECT]].card_name
    
    return story_format % [subject, verb, object]
    
func compose_sultan_text():
    var text = "Sultan: "
    if (Story.offense == 0 && Story.repeats == 0):
        text += "How interesting!"
    else:
        match (Story.repeats):
            0: 
                pass
            1:
                text += "Didn't that happen before? "
            2:
                text += "I'm sure that already happened. "
            3, 4, 5:
                text += "You're repeating yourself! "
        if (Storyrules.offenses.has(Storyrules.rules.CHAUVANIST)):
            text += "A woman couldn't overpower a man!"
    return text

func compose_sultan_mood():
    var text = "The sultan seems "
    match Story.annoyance:
        0:
            text += "pleased"
        1, 2:
            text += "satisfied"
        3, 4:
            text += "doubtful"
        5, 6:
            text += "sceptical"
        7, 8:
            text += "offended"
        9, 10:
            text += "outraged"
    text += " and "
    match Story.boredom:
        0:
            text += "highly engaged"
        1, 2: 
            text += "interested"
        3, 4:
            text += "disengaged"
        5, 6:
            text += "bored"
        7, 8:
            text += "miserable"
        9, 10:
            text += "soporific"
    text += "."
    return text
    
func blank_text():
    $StoryText.text = ""
    $SultanText.text = ""
    $SultanMood.text = ""
