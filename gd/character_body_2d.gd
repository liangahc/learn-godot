extends CharacterBody2D

var move_speed:int=30000;

func _physics_process(delta: float) -> void:
	velocity=Vector2(0,0);
	
	velocity.x=Input.get_axis("left","right") * move_speed * delta;

	if Input.is_action_pressed("down"):
		print("down");
		velocity.y = move_speed * delta;
		
	if Input.is_action_pressed("up"):
		print("up");
		velocity.y = -move_speed * delta;
		
	move_and_slide();
