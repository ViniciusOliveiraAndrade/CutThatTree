extends Node2D

@onready var sprite: Sprite2D = $Sprite
@onready var timer: Timer = $Timer

func look_right() -> void:
	sprite.flip_h = false


func look_left() -> void:
	sprite.flip_h = true
	

func cut_tree() -> void:
	sprite.frame = 1
	timer.start()

func _on_timer_timeout() -> void:
	sprite.frame = 0
