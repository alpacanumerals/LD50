extends Area2D

enum stages { START, STORY, SULTAN, MOOD, END, STAB }
var stage : int
var failed : bool

var block : bool

const story_format = "Scheherazade: The %s %s the %s"

signal night_over
signal game_over

var annoy_colour
var bored_colour

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
                    update_sultan_mood(["Scheherazade: Oh shut up, you bloviating bore!", "", "", "", ""])
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
                    update_sultan_mood(compose_sultan_mood())
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
    var text = ["The sultan seems "]
    match Story.annoyance:
        0:
            text.append("pleased")
        1:
            text.append("slightly displeased")
        2:
            text.append("displeased")
        3:
            text.append("very displeased")
        4:
            text.append("slightly upset")
        5:
            text.append("upset")
        6:
            text.append("very upset")
        7:
            text.append("slightly angry")
        8:
            text.append("angry")
        9:
            text.append("very angry")
        10:
            text.append("outraged")
    annoy_colour = get_feedback_color(Story.annoyance)
    text.append(" and ")
    match Story.boredom:
        0:
            text.append("interested")
        1:
            text.append("slightly distracted")
        2:
            text.append("distracted")
        3:
            text.append("very distracted")
        4:
            text.append("slightly disengaged")
        5:
            text.append("disengaged")
        6:
            text.append("very disengaged")
        7:
            text.append("slightly bored")
        8:
            text.append("bored")
        9:
            text.append("very bored")
        10:
            text.append("desperate to be anywhere else")
    bored_colour = get_feedback_color(Story.boredom)
    text.append(".")
    return text
    
func get_feedback_color(value):
    if value > 10:
        value = 10
    if value < 0:
        value = 0
    return Color8(55+value*20, 200-value*20, 0)

func update_sultan_mood(text_array):
    $TextContainer/SultanMood/Start.text = text_array[0]
    $TextContainer/SultanMood/AnnoyMood.text = text_array[1]
    $TextContainer/SultanMood/Conjunction.text = text_array[2]
    $TextContainer/SultanMood/BoreMood.text = text_array[3]
    $TextContainer/SultanMood/FullStop.text = text_array[4]
    $TextContainer/SultanMood/AnnoyMood.add_color_override("font_color", annoy_colour)
    $TextContainer/SultanMood/BoreMood.add_color_override("font_color", bored_colour)

func blank_text():
    $TextContainer/StoryText.text = ""
    $TextContainer/SultanText.text = ""
    $TextContainer/SultanMood/Start.text = ""
    $TextContainer/SultanMood/AnnoyMood.text = ""
    $TextContainer/SultanMood/Conjunction.text = ""
    $TextContainer/SultanMood/BoreMood.text = ""
    $TextContainer/SultanMood/FullStop.text = ""

func add_comments(text, comments):
    var first = true
    for comment in comments:
        if first:
            text += comment
            first = false
        else:
            text += "\n" + comment
    return text
