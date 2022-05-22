extends Node2D

enum Direction {RIGHT = -1, LEFT = 1}
enum Type {GROUND = 0, AIR = 1}

export(Direction) var direction = Direction.LEFT
export(Type) var type = Type.AIR
export(float) var time: float = 4
export(float) var tolerance: float = 0.25
export(float) var speed: float = 25

export(PackedScene) var enemy_type: PackedScene

var enemies = []
var times = []

func spawn() -> void:
	var new_enemy: AnimatedSprite = enemy_type.instance()
	new_enemy.flip_h = direction == Direction.RIGHT
	add_child(new_enemy)
	enemies.append(new_enemy)
	times.append(0)

func attacked() -> bool:
	if enemies.size() == 0:
		return false
	if times[0] < time - tolerance:
		return false
	enemies[0].queue_free()
	enemies.remove(0)
	times.remove(0)
	return true

func _process(delta: float) -> void:
	for i in range(enemies.size() - 1, -1, -1):
		var enemy: AnimatedSprite = enemies[i]
		enemy.position.x += speed * delta * direction
		times[i] += delta
		if enemy.animation == "default" and times[i] > time - tolerance:
			var frame = enemy.frame
			enemy.animation = "in_range"
			enemy.frame = frame
		if times[i] > time + tolerance:
			GameController.damagePlayer()
			enemies.remove(i)
			times.remove(i)
			enemy.queue_free()
