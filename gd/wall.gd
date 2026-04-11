@tool
extends StaticBody2D;

@onready var collision = $collision;
@onready var sprite = $sprite;

@export var width: float = 100:
	set(value):
		width = value;
		update_wall();

@export var height: float = 100:
	set(value):
		height = value;
		update_wall();

func update_wall():
	var rect = RectangleShape2D.new();
	rect.size = Vector2(width, height);
	collision.shape = rect;

	sprite.scale = Vector2(width / 100.0, height / 100.0);
