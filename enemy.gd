extends CharacterBody2D
class_name Enemy

const speed = 100
@export var player: Node2D
#@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(delta):

	var dir = (player.position - position).normalized()
	if dir.x > 0:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
	velocity = dir * speed
	
	move_and_slide()
	#
#func makepath() -> void:
	#nav_agent.target_position = player.global_position
	#

func _on_timer_timeout():
	#makepath()
	pass
	
	
func damage():
	queue_free()
