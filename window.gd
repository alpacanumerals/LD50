extends Area2D

export var part_of_speech: int

func _ready():
    pass

func _process(_delta):
    if (Story.current_tale.has(part_of_speech)):
        var content_id = Story.current_tale[part_of_speech]
        var tex = Story.cards[content_id].texture
        $Sprite.set_texture(tex)
    else:
        $Sprite.set_texture(null)
