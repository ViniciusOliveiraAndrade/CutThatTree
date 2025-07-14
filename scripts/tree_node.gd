extends Node2D

class_name TreeNode

@onready var sprite: Sprite2D = $Sprite



var right_node : bool = true

func _ready() -> void:
	_createTreeNode()


func _createTreeNode() -> void :
	match randi_range(0, 1):
		0:
			_creatRight()
		1:
			_creatLeft()


func _creatRight() -> void:
	sprite.frame = 2
	right_node = true


func _creatLeft() -> void:
	sprite.frame = 1
	right_node = false

func is_right_node_tree() -> bool:
	return right_node
