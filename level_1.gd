extends Node2D

@onready var spawntimer = $SpawnTimer
@onready var enemy_instance = preload("res://enemy.tscn")
@onready var player = $Player

const safe_range = 500

func _process(delta):
	
	pass


func _on_spawn_timer_timeout():
	var enemy = enemy_instance.instantiate()
	enemy.position = player.position + Vector2(safe_range, 0).rotated(randf_range(0, 2*PI))
	enemy.player = player
	add_child(enemy)
	pass # Replace with function body.

