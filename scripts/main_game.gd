extends Node2D

@export var tree_offset_x: float = 160.0
@export var tree_offset_y: float = 95.0
@export var tree_spacing: float = 22.0
@export var TREE_NODE: PackedScene
@export var tree_count: int = 13
@export var move_down_duration: float = 0.2

@onready var tree_holder: Node2D = $TreeHolder
@onready var player: Node2D = $Player
@onready var right_mark: Marker2D = $PlayerPositions/RightMark
@onready var left_mark: Marker2D = $PlayerPositions/LeftMark
@onready var score: Label = $Hud/Score


var tree: Array[TreeNode] = []



func _ready() -> void:
	print("Stat game")
	_create_tree()
	_position_player()
	_update_score()


func _create_tree() -> void:
	for i in tree_count:
		var tree_node = _create_tree_node(i)
		tree.append(tree_node)
		tree_holder.add_child(tree_node)


func _create_tree_node(index: int) -> TreeNode:
	var tree_node = TREE_NODE.instantiate()
	tree_node.position = Vector2(tree_offset_x, (index * -tree_spacing) - tree_offset_y )
	return tree_node


func _recycle_tree() -> void:
	if tree.is_empty():
		return

	# Remove o primeiro
	var first_tree_node = tree.pop_front()
	tree_holder.remove_child(first_tree_node)
	first_tree_node.queue_free()

	# Move os restantes para baixo
	for i in tree.size():
		var target_y = (i * -tree_spacing) - tree_offset_y
		var tween = create_tween()
		tween.tween_property(tree[i],"position:y",target_y,move_down_duration).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)


	# Adiciona um novo no final
	var new_index = tree.size()
	var new_tree = _create_tree_node(new_index)
	tree.append(new_tree)
	tree_holder.add_child(new_tree)


func _position_player() -> void:
	if tree[0].is_right_node_tree():
		player.global_position = left_mark.global_position
		player.look_right()
	else:
		player.global_position = right_mark.global_position
		player.look_left()


func _on_left_b_pressed() -> void:
	_recycle_tree()
	player.global_position = left_mark.global_position
	player.look_right()
	player.cut_tree()
	if tree[0].is_right_node_tree():
		GameManager.score+=1
		
	else:
		GameManager.score=0
	
	_update_score()


func _on_right_b_pressed() -> void:
	_recycle_tree()
	player.global_position = right_mark.global_position
	player.look_left()
	player.cut_tree()
	if not tree[0].is_right_node_tree():
		GameManager.score+=1
	else:
		GameManager.score=0
	
	_update_score()


func _update_score() -> void:
	score.text=str(GameManager.score)
