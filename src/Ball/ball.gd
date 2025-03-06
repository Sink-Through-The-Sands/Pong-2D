extends CharacterBody2D


const SPEED = 15.0
var initial_position: Vector2

func _ready() -> void:
	velocity = Vector2(-SPEED, 0)
	initial_position = position

func _physics_process(delta: float) -> void:
	var col: KinematicCollision2D = move_and_collide(velocity)
	if col:
		if col.get_collider().is_in_group("walls"):
			reset()
		else:
			var normal := col.get_normal()
			velocity = velocity.bounce(normal)
			
func reset() -> void:
	position = initial_position
	velocity = Vector2(-SPEED, 0)
