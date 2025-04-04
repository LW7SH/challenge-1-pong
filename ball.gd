extends RigidBody2D



@export var speed : float
var direction : Vector2
var velocity

func _ready() -> void:
	direction = Vector2(randf_range(-1.0, 1.0), randf_range(-0.3, 0.3)).normalized()
	print(direction)


func _physics_process(delta):
	velocity = move_and_collide(direction * speed)
	if velocity:
		direction = direction.bounce(velocity.get_normal())
