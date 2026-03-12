extends RigidBody2D

@onready var collision=$collision;
@onready var sprite=$sprite;

func init_wall(x:float,y:float,width:float,height:float) -> void:
	position=Vector2(x,y);
	
	scale=Vector2(height / 100 , width / 100);
	
	collision.position = Vector2(0, 0);
	
	if collision.shape is RectangleShape2D:
		var rect_shape = collision.shape as RectangleShape2D
		rect_shape.size = Vector2(width, height)  # 直接设目标宽高，不用除100（缩放由根节点处理）
		collision.shape = rect_shape  # 应用修改
