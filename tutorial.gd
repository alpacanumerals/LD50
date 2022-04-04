extends Node2D

var tutorial_on : bool = true

func _ready():
    tutorial_on = true

func _process(_delta):
    if tutorial_on:
        $Label0.visible = true
        $Label1.visible = false
        $Label2.visible = false
        $Label3.visible = false
        $Label4.visible = false
        match Story.current_phase:
            Story.phase.SUBJECT:
                $Label1.visible = true
            Story.phase.VERB:
                $Label2.visible = true
            Story.phase.OBJECT:
                $Label3.visible = true
            Story.phase.NONE:
                $Label4.visible = true
                
    else:
        $Label0.visible = false
        $Label1.visible = false
        $Label2.visible = false
        $Label3.visible = false
        $Label4.visible = false
