extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_racket: CollisionShape2D = $Racket/CollisionShape2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#Sending variables to global code
	Global.player_velocity = velocity
	#Basic Walking
	if Input.is_action_pressed("right"):
		velocity.x = 60
		animation.play("walk")
	elif Input.is_action_pressed("left"):
		velocity.x = -60
		animation.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, 2)
		animation.play("idle")
	#Jumping
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -150
	#Dashing
	if Input.is_action_just_pressed("dash left"):
		velocity.x += -150
	elif Input.is_action_just_pressed("dash right"):
		velocity.x += 120
	
	#"Gravity"-17 6.5
	if is_on_floor() != true:
		if velocity.y < 0:
			velocity.y += 5
		else:
			velocity.y += 8
	#Fliping the animation
	if velocity.x > 0:
		animation.flip_h = true
		collision_racket.position.x = 10
	if velocity.x < 0:
		animation.flip_h = false
		collision_racket.position.x = -17


	move_and_slide()
