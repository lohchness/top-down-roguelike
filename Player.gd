extends CharacterBody2D

const RUN_SPEED = 175
const WALK_SPEED = 78.5
var curr_speed = RUN_SPEED
#const TIME_BETWEEN_BULLETS = 0.1

var bullet_instance = preload("res://bullet.tscn")
@onready var attack_timer = $attack_timer
var can_attack = true

@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D

func _ready():
	pass

func _process(delta):
	curr_speed = RUN_SPEED
	
	$Marker2D.look_at(get_global_mouse_position())
	var dir = get_global_mouse_position() - position
	$GunNode.rotation = get_angle_to(get_global_mouse_position())
	$GunNode/Gun.scale.y = (-.344 if dir.x < 0 else .344)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#var dir = get_global_mouse_position() - position
		$Sprite2D.flip_h = (dir.x < 0)
		
		curr_speed = WALK_SPEED
		if can_attack:
			var bullet = bullet_instance.instantiate()
			bullet.rotation = $Marker2D.rotation
			add_child(bullet)
			
			attack_timer.start()
			can_attack = false

func _physics_process(delta):
	var dir = Input.get_vector("left", "right", "up", "down")
	velocity = dir * curr_speed
	print_debug(dir)
	
	if dir.x != 0:
		sprite.flip_h = (dir.x < 0)
	
	move_and_slide()
	
	update_animations(dir)

func update_animations(dir):
	if dir == Vector2.ZERO:
		ap.play("Idle")
	else:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			ap.play("Walk")
		else:
			ap.play("Run")
	
	
func _on_attack_timer_timeout():
	can_attack = true
