extends Node2D

export(float) var time_between_spawns: float = 1

export(NodePath) var track_container_path
onready var track_container = get_node(track_container_path)

var tracks = {}
var time_since_last_spawn: float = 0

func _ready() -> void:
	var all_tracks = track_container.get_children()
	for track in all_tracks:
		var direction = track.direction
		if direction == 1:
			direction = "Left"
		else:
			direction = "Right"
		var type = track.type
		if type == 1:
			type = "Air"
		else:
			type = "Ground"
		var input = direction + type
		if not tracks.has(input):
			tracks[input] = []
		tracks[input].append(track)

func _process(delta: float) -> void:
	if track_container.get_children().size() == 0:
		return
	time_since_last_spawn += delta
	if time_since_last_spawn > time_between_spawns:
		time_since_last_spawn -= time_between_spawns
		var all_tracks = track_container.get_children()
		var track = all_tracks[randi() % all_tracks.size()]
		track.spawn(time_since_last_spawn)
	if Input.is_key_pressed(KEY_ESCAPE):
		togglePauseGame()

func _on_Player_attacked(input: String, player: Player) -> void:
	if not tracks.has(input):
		player.miss()
		return
	var input_tracks = tracks[input]
	var hit = false
	for track in input_tracks:
		hit = track.attacked()
		if hit:
			break
	if not hit:
		player.miss()
	else:
		GameController.souls += 1
		print(GameController.souls)

func togglePauseGame() -> void:
	print("the game is ", get_tree().paused)
	if get_tree().paused:
		$pause_popup.hide()
		get_tree().paused = false
	else:
		get_tree().paused = true
		$pause_popup.show()
