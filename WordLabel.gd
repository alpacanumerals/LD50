extends Label

export var part_of_speech: int
export var label_text: String

func _process(_delta):
    if (Story.current_tale.has(part_of_speech)):
        var content_id = Story.current_tale[part_of_speech]
        text = label_text + Story.cards[content_id].card_name + " (" + str(content_id) + ")"
    else:
        text = label_text
