extends Node2D

func _process(delta):
	rotate(get_angle_to(get_global_mouse_position()) + deg_to_rad(90))
