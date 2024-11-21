extends CharacterBody2D

# Movement speed - Tuned to be slower since the wizard is old as hell
var speed = 100

# Stats Dictionary
var stats = {
	"health": 100,
	"attack": 10,
	"defense": 5,
	"speed": 200
}

# weapon that the wizard holds - Currently still need to optimize header files to make this work. 
var weapon: Weapon = null
#equip weapon
func equip_weapon(new_weapon: Weapon):
	weapon = new_weapon
	weapon.apply_effect(self) # buff the weapon based on wizard stats
	

func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# Normalize to prevent faster diagonal movement
	input_vector = input_vector.normalized()
	velocity = input_vector * stats["speed"]
	move_and_slide()
