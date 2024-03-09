extends Area2D

const BULLET_SPEED = 200

func _ready():
	pass

func _process(delta):
	position += (Vector2.RIGHT * BULLET_SPEED).rotated(rotation ) * delta

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.has_method("damage"):
		body.damage()
		queue_free()
	pass # Replace with function body.
