extends RigidBody2D

var attack_speed = 500
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(linear_velocity)
	



func _on_area_2d_area_entered(area: Area2D) -> void:
	if Global.player_shoot == false:
		linear_velocity.x = attack_speed * Global.player_facing_dir
	else:
		linear_velocity.y = -300 + Global.player_velocity.y/3
		linear_velocity.x = Global.player_velocity.x/2
		look_at((position + linear_velocity).normalized())
