extends Node2D

var tutorial_on: bool = true
var night: bool = false

func _ready():
    tutorial_on = Options.tutorial
    night = false

func _process(_delta):
    if tutorial_on:
        $Label0.visible = true
        $Label1.visible = false
        $Label2.visible = false
        $Label3.visible = false
        $Label4.visible = false
        $Label5.visible = false
        $Arrows.visible = true
        match Story.current_phase:
            Story.phase.SUBJECT:
                $Label1.visible = true
            Story.phase.VERB:
                $Label2.visible = true
            Story.phase.OBJECT:
                $Label3.visible = true
            Story.phase.NONE:
                $Label4.visible = true
                $Arrows.visible = false
        if night:
            $Label0.visible = false
            $Label5.visible = true 
    else:
        $Label0.visible = false
        $Label1.visible = false
        $Label2.visible = false
        $Label3.visible = false
        $Label4.visible = false
        $Label5.visible = false
        $Arrows.visible = false

func _on_NightArea_night_over():
    tutorial_on = false
