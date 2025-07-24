extends Node

var playerData := PlayerData.new()

func _ready():
	verify_save_directory(GameManager.save_path)
	
func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path)
	
func save_data():
	playerData.highscore = GameManager.highscore
	ResourceSaver.save(playerData, GameManager.save_path + playerData.save_name )
	
func load_data():
	if not FileAccess.file_exists(GameManager.save_path + playerData.save_name):
		return
	else:
		playerData = ResourceLoader.load(GameManager.save_path + playerData.save_name).duplicate(true)
		GameManager.highscore = playerData.highscore
