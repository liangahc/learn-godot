extends Node2D

@onready var pmap:PackedScene=preload("res://tscn/map.tscn");
@onready var pcharacter:PackedScene=preload("res://tscn/character.tscn");

func _ready() -> void:
	var map=pmap.instantiate();
	var character=pcharacter.instantiate();
	
	add_child(map);
	add_child(character);
