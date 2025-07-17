extends Control

const MAIN_GAME = preload("res://scenes/main_game.tscn")
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(MAIN_GAME)


func _on_credits_button_button_down() -> void:
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit()
