extends Node2D

@onready var character = $".." as CharacterBody2D

enum state {
	idle,
	move,
	jump,
	fall
}

var current_state: state = state.idle

@export var move_speed: float = 1000.0
@export var jump_force: float = 800.0
@export var gravity: float = 1800.0

func _ready() -> void:
	if not character:
		print("未找到父节点角色！请将脚本挂在角色子节点上");
		return;
	
	change_state(state.idle);

func change_state(new_state: state) -> void:
	current_state = new_state;
	
	print("切换为",new_state,"状态");
	
	enter_state(new_state);

func enter_state(new_state: state) -> void:
	match new_state:
		state.idle:
			print("📊 状态：待机");
		state.move:
			print("📊 状态：移动");
		state.jump:
			print("📊 状态：跳跃");
			character.velocity.y = -jump_force
		state.fall:
			print("📊 状态：下落");
			
			

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
	var input_dir: float = Input.get_axis("left", "right");
	
	if abs(input_dir) > 0.1:
		change_state(state.move);
	
	if not character.is_on_floor():
		change_state(state.fall);
	
	if Input.is_action_just_pressed("up") and character.is_on_floor():
		change_state(state.jump);
		
		

# 移动逻辑
func do_move() -> void:
	var input_dir: float = Input.get_axis("left", "right")
	
	if abs(input_dir) < 0.1:
		change_state(state.idle);
	
	if not character.is_on_floor():
		change_state(state.fall);
	
	if Input.is_action_just_pressed("up") and character.is_on_floor():
		change_state(state.jump);

func do_jump() -> void:
	if character.velocity.y > 0:
		change_state(state.fall);

func do_fall() -> void:
	if character.is_on_floor():
		change_state(state.idle);

func _physics_process(delta: float) -> void:
	if not character:
		return;
	
	character.velocity.y += gravity * delta;
	
	var input_dir: float = Input.get_axis("left", "right");
	
	if current_state==state.jump or current_state == state.fall:
		character.velocity.x = 0.8 * move_speed * input_dir;
	else:
		character.velocity.x = move_speed * input_dir;
	
	character.move_and_slide();
	
	update_state();
