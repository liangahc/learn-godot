extends Node2D

@onready var character = $".."

enum state
{
	idle,
	move,
	jump,
	fall
}

var current_state:state=state.idle;

func change_state(new_state:state) -> void:
	current_state=new_state;
	
	enter_state(new_state);
	
func enter_state(new_state:state) -> void:
	match new_state:
		state.idle:
			print("idle");
		state.move:
			print("move");
		state.jump:
			print("jump");
		state.fall:
			print("fall");
			
func update_state() -> void:
	match current_state:
		state.idle:
			do_idle();
		state.move:
			do_move();
		state.jump:
			do_jump();
		state.fall:
			do_fall();
	
func do_idle() -> void:
	var velocity;
	
func do_move() -> void:
	pass;
	
func do_jump() -> void:
	pass;

func do_fall() -> void:
	pass;

func _process(delta: float) -> void:
	pass;
