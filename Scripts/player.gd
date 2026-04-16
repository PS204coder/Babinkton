extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_racket: CollisionShape2D = $Racket/CollisionShape2D
@onready var timer: Timer = $Timer




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#Sending variables to global code
	if animation.flip_h == true:
		Global.player_facing_dir = 1
	elif animation.flip_h == false:
		Global.player_facing_dir = 0

	Global.player_facing_dir = animation.flip_h
	Global.player_velocity = velocity
	#Basic Walking
	if Input.is_action_just_pressed("shoot") and Global.player_shoot == true:
		animation.play("attack")
		Global.player_shoot = false
		timer.start()
	elif Input.is_action_pressed("right"):
		velocity.x = 60
		if animation.is_playing() == false:
			animation.play("walk")
	elif Input.is_action_pressed("left") :
		velocity.x = -60
		if animation.is_playing() == false:
			animation.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, 3)
		if animation.is_playing() == false:
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
		if animation.animation == "idle":
			collision_racket.position.x = 10
			collision_racket.scale = Vector2(1.1, 1.1)
		elif animation.animation == "attack":
			collision_racket.position = Vector2(0, 0)
			collision_racket.scale = Vector2(2.5, 2.5)
	if velocity.x < 0:
		animation.flip_h = false
		if animation.animation == "idle":
			collision_racket.position.x = -17
			collision_racket.scale = Vector2(1.1, 1.1)
		elif animation.animation == "attack":
			collision_racket.position = Vector2(0, 0)
			collision_racket.scale = Vector2(2.5, 2.5)

	move_and_slide()


func _on_timer_timeout() -> void:
	Global.player_shoot = true
