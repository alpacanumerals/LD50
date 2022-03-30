extends Area2D

var speed = 200
var vector : Vector2
var lifespan : int = 100
var age : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _physics_process(delta):
    age += delta
    if age > lifespan:
        queue_free()
    position += vector * speed * delta
    
