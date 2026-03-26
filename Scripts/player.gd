extends RigidBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var racket: Sprite2D = $Racket

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("walk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
