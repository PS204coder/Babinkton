extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.opponent_points = frame + 1


func _on_opponent_court_body_entered(body: Node2D) -> void:
	frame += 1
