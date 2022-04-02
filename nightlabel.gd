extends Label

func _ready():
    pass

func _process(_delta):
    self.text = "Night " + str(Story.night)
