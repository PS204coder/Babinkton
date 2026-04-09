extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(linear_velocity)



func _on_area_2d_area_entered(area: Area2D) -> void:
	linear_velocity.y = -300 + Global.player_velocity.y/3
	linear_velocity.x = Global.player_velocity.x/2
	look_at((position + linear_velocity).normalized())
