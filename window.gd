extends Area2D

export var part_of_speech: int

var game_over: bool

func _ready():
    game_over = false

func _process(_delta):
    if (!game_over && Story.current_tale.has(part_of_speech)):
        var content_id = Story.current_tale[part_of_speech]
        var tex = Story.cards[content_id].texture
        $Sprite.set_texture(tex)
    else:
        $Sprite.set_texture(null)

func _on_NightArea_game_over():
    game_over = true
