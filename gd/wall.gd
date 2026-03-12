extends RigidBody2D

@onready var collision=$collision;
@onready var sprite=$sprite;

func init_wall(x:float,y:float,height:float,width:float) -> void:
	position=Vector2(x,y);
	
	#print(height / 100 ,width / 100);
	
	scale=Vector2(height / 100 , width / 100);
	
	collision.position = Vector2(x,y);
	collision.scale = Vector2(height / 100 ,width / 100);
	
func _ready() -> void:
	init_wall(600,400,500,50);
