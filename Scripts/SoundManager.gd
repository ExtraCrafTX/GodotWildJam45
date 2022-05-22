class_name SoundManager
extends Node2D

export var bus := "Master"

var audio_players := []
var positional_audio_players := []

func play(stream: AudioStreamSample, volume: float = -3, pitch: float = 1) -> void:
	for player in audio_players:
		if not player.playing:
			_play(player, stream, volume, pitch)
			return
	var player := AudioStreamPlayer.new()
	player.bus = bus
	add_child(player)
	audio_players.append(player)
	_play(player, stream, volume, pitch)
	pass

func play_pitched(stream: AudioStreamSample, volume: float = -3, min_pitch: float = 1, max_pitch: float = 1.2):
	var pitch := rand_range(min_pitch, max_pitch)
	play(stream, volume, pitch)

func play_positional(stream: AudioStreamSample, volume: float = -3, pitch: float = 1) -> void:
	for player in positional_audio_players:
		if not player.playing:
			_play(player, stream, volume, pitch)
			return
	var player := AudioStreamPlayer2D.new()
	add_child(player)
	positional_audio_players.append(player)
	_play_positional(player, stream, volume, pitch)
	pass

func _play(player: AudioStreamPlayer, stream: AudioStreamSample, volume: float, pitch: float):
	player.stream = stream
	player.volume_db = volume
	player.pitch_scale = pitch
	player.play()

func _play_positional(player: AudioStreamPlayer2D, stream: AudioStreamSample, volume: float, pitch: float):
	player.stream = stream
	player.volume_db = volume
	player.pitch_scale = pitch
	player.play()
