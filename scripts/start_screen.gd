extends Control

const MAIN_GAME = preload("res://scenes/main_game.tscn")
const CHOP_1 = preload("res://assets/sounds/chop1.mp3")

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var score: Label = $CanvasLayer/Score


func _ready() -> void:
	BgAudio.play_music_level()
	audio_stream_player.stream = CHOP_1
	score.text = "Highest Score: " + str(GameManager.highscore)
	#pass


func _on_start_button_pressed() -> void:
	audio_stream_player.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_packed(MAIN_GAME)
	


func _on_credits_button_button_down() -> void:
	audio_stream_player.play()
	await get_tree().create_timer(0.1).timeout
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	audio_stream_player.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()
