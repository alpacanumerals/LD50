extends Area2D

enum stages { START, STORY, SULTAN, MOOD, END, STAB }
var stage : int
var failed : bool

var block : bool

const story_format = "Scheherazade: The %s %s the %s"

signal night_over
signal game_over

func _ready():
    $NightSprite.modulate.a = 0
    $NightSprite.visible = false
    set_process_input(false)
    failed = false
    block = false

func initialise():
    blank_text()
    stage = stages.START
    block = false

func night_fall(has_failed):
    initialise()
    failed = has_failed
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

func _input(event):
    if (event.is_action_pressed("left_click")):
        if (failed):
            match stage:
                stages.START:
                    $TextContainer/StoryText.text = compose_story_text()
                    stage = stages.STORY
                stages.STORY:
                    $TextContainer/SultanText.text = "Sultan: Ugh, this is terrible. I may as well go ask a peddler at the market!"
                    stage = stages.MOOD
                stages.MOOD:
                    $TextContainer/SultanMood.text = "Scheherazade: Oh shut up, you bloviating bore!"
                    stage = stages.END
                stages.END:
                    if (!block):
                        block = true
                        Sound.play_stab()
                        emit_signal("game_over")
                        yield(get_tree().create_timer(1), "timeout")
                        dawn_break()
                        stage = stages.STAB
                stages.STAB:
                    yield(get_tree().create_timer(0.5), "timeout")
                    Switcher.switch_scene("res://TitleScreen.tscn")
        else:
            match stage:
                stages.START:
                    $TextContainer/StoryText.text = compose_story_text()
                    stage = stages.STORY
                stages.STORY:
                    $TextContainer/SultanText.text = compose_sultan_text()
                    stage = stages.MOOD
                stages.MOOD:
                    $TextContainer/SultanMood.text = compose_sultan_mood()
                    stage = stages.END
                stages.END:
                    emit_signal("night_over")
                    dawn_break()
                    set_process_input(false)
                    Story.next_night()
    get_tree().set_input_as_handled()

func compose_story_text():
    if Story.out_of_time:
        return "Scheherazade: The er... someone, did something..."
    if Story.out_of_nights:
        return "Scheherazade: Are you seriously going to make me tell you\na bedtime story for more than a thousand nights in a row?"

    var subject = Story.cards[Story.current_tale[Story.phase.SUBJECT]].card_name
    var verb = Story.cards[Story.current_tale[Story.phase.VERB]].card_name
    var object = Story.cards[Story.current_tale[Story.phase.OBJECT]].card_name

    return story_format % [subject, verb, object]
    
func compose_sultan_text():
    var text = ""
    if (Story.offense <= 0 && Story.repeats == 0):
        text = "I see. Continue..."
    else:
        var comments = []
        match (Story.repeats):
            0: 
                pass
            1:
                comments.append("Didn't that happen before?")
            2:
                comments.append("I'm sure that already happened.")
            3, 4, 5:
                comments.append("You're repeating yourself!")
        comments.append_array(
                Sultanspeech.speak(
                    Story.current_tale[Story.phase.SUBJECT],
                    Story.current_tale[Story.phase.VERB],
                    Story.current_tale[Story.phase.OBJECT]
                )
            )
        text = add_comments(text, comments)
    return "Sultan: " + text

func compose_sultan_mood():
    var text = "The sultan seems "
    match Story.annoyance:
        0:
            text += "pleased"
        1:
            text += "slightly displeased"
        2:
            text += "displeased"
        3:
            text += "very displeased"
        4:
            text += "slightly upset"
        5:
            text += "upset"
        6:
            text += "very upset"
        7:
            text += "slightly angry"
        8:
            text += "angry"
        9:
            text += "very angry"
        10:
            text += "outraged"
    text += " and "
    match Story.boredom:
        0:
            text += "interested"
        1:
            text += "slightly distracted"
        2:
            text += "distracted"
        3:
            text += "very distracted"
        4:
            text += "slightly disengaged"
        5:
            text += "disengaged"
        6:
            text += "very disengaged"
        7:
            text += "slightly bored"
        8:
            text += "bored"
        9:
            text += "very bored"
        10:
            text += "desperate to be anywhere else"
    text += "."
    return text
    
func blank_text():
    $TextContainer/StoryText.text = ""
    $TextContainer/SultanText.text = ""
    $TextContainer/SultanMood.text = ""

func add_comments(text, comments):
    var first = true
    for comment in comments:
        if first:
            text += comment
            first = false
        else:
            text += "\n" + comment
    return text
