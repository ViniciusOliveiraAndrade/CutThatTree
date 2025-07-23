extends Node2D

@onready var sprite: Sprite2D = $Sprite
@onready var timer: Timer = $Timer
@onready var chop_fx: AudioStreamPlayer2D = $ChopFx
const CHOP_STREAM = preload("res://assets/sounds/chop4.mp3")

func _ready() -> void:
	chop_fx.stream = CHOP_STREAM

func look_right() -> void:
	sprite.flip_h = false


func look_left() -> void:
	sprite.flip_h = true
	

func cut_tree() -> void:
	sprite.frame = 1
	timer.start()
	chop_fx.play()
	

func _on_timer_timeout() -> void:
	sprite.frame = 0
