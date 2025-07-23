extends AudioStreamPlayer

const bg_music = preload("res://assets/sounds/bg_sound_loop6.mp3")

func _play_music(music: AudioStream, volume =0.0 ):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()
	
func play_music_level():
	_play_music(bg_music,-10.0)
