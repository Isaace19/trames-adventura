###################################
# Name: Isaac Abella
# Description: Driver Code for simple characters - stats and templates for other classes to be implemented
# Use classes and Object Oreinted Approaches to make module code. 
###################################

extends CharacterBody2D

class_name BaseCharacter 
var character_name: String = ""
var stats: Dictionary = {}

func _init(character_name: String, base_stats: Dictionary):
		name = character_name
		stats = base_stats.duplicate() 

# Common Stats that every character should have

func attack(target):
		#implement attack logic onto enemy character
		pass

func interact():
		#implement interaction logic on node objects
		pass


#virtual function to be overidden by child classes
func special_ability():
		push_error("special_ability() must be implemented in derived character classes")




# Adding in movement scripts to the base character for better practice
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
