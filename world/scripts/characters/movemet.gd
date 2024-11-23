###################################
# Name: Isaac Abella
# Description: Driver Code for simple movement mimicing pokemone 2D style
# Object Oreinted Style class that all characters from char_factory should be able to make use of
###################################

extends CharacterBody2D

# set tile size in game, default to 16pixels
# create a moving variable

const tile_size = 16
var moving = false

var input_dir
func _physics_process(delta: float) -> void:
	input_dir = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		input_dir = Vector2(0,1)
		move()
	elif Input.is_action_pressed("ui_up"):
		input_dir = Vector2(0,-1)
		move()
	elif Input.is_action_pressed("ui_right"):
		input_dir = Vector2(1,0)
		move()
	elif Input.is_action_pressed("ui_left"):
		input_dir = Vector2(-1,0)
		move()
	move_and_slide()

func move():
	# verify move when action is pressed
	if input_dir:
		if moving == false:
			moving = true
			var tween = create_tween()
			tween.tween_property(self, "position", position + input_dir*tile_size, 0.35)
			tween.tween_callback(move_false) # moving is now false

func move_false():
	moving = false