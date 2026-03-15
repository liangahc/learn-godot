extends StaticBody2D

@onready var collision=$collision;
@onready var sprite=$sprite;

func init_wall(x:float,y:float,width:float,height:float) -> void:
	position=Vector2(x,y);
	
	sprite.scale=Vector2(height / 100 , width / 100);
	
	collision.position = Vector2(0, 0);
	
	var rect=RectangleShape2D.new();
	
	rect.set_size(Vector2(height,width));
	
	collision.shape=rect;
	
	print(collision.shape.size);
