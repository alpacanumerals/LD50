extends ProgressBar

export(String) var stat_name

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

func _process(_delta):
    self.value = Story[stat_name]
