extends RigidBody2D

@onready var collision=$collision;
@onready var sprite=$sprite;

func init_wall(x:float,y:float,width:float,height:float) -> void:
	position=Vector2(x,y);
	
	scale=Vector2(height / 100 , width / 100);
	
	collision.position = Vector2(x,y);
	collision.scale = Vector2(height / 100 ,width / 100);
