extends Area2D

export var speed = 400
var screen_size
var bullet

func _ready():
    screen_size = get_viewport_rect().size
    bullet = load("res://Bullet.tscn")

func _process(delta):
    var velocity = Vector2.ZERO
    if Input.is_action_pressed("move_right"):
        velocity.x += 1
    if Input.is_action_pressed("move_left"):
        velocity.x -= 1
    if Input.is_action_pressed("move_down"):
        velocity.y += 1
    if Input.is_action_pressed("move_up"):
        velocity.y -= 1

    if velocity.length() > 0:
        velocity = velocity.normalized() * speed

    position += velocity * delta
    position.x = clamp(position.x, 0, screen_size.x)
    position.y = clamp(position.y, 0, screen_size.y)

func _on_Playfield_player_click(click_pos):
    shoot(click_pos)

func shoot(target):
    var b = bullet.instance()
    owner.add_child(b)
    b.position = position
    
    var vector = Vector2(target.x - position.x, target.y - position.y).normalized()
    
    b.vector = vector
