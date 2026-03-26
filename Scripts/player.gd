extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var racket: Sprite2D = $Racket

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("walk")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right"):
		position.x += 2
	if Input.is_action_just_pressed("left"):
		position.x += 2
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += 50 
		
	if is_on_floor() != true:
		position.y += 1
