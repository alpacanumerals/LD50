extends Button

export(int) var boredom_effect
export(int) var disbelief_effect
export(int) var annoyance_effect

func _ready():
    pass # Replace with function body.

func _on_Button_pressed():
    Story.tell_story(boredom_effect, disbelief_effect, annoyance_effect)
