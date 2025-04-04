extends CharacterBody2D

@export var speed : float

func _physics_process(delta):
	var direction = Input.get_axis("ui_up", "ui_down")
	#print(direction)
	var movement = Vector2(0, direction) * speed
	if movement != Vector2.ZERO:
		move_and_collide(movement)
