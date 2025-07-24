extends Node

var score : int = 0
var highscore := 0
#var lastscore := 0
var save_path := "user://save/"

func _ready() -> void:
	SaveLoadData.load_data()
