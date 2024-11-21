extends CharacterBody2D

# Procedural Generation for weapon creation

var name: String = "Basic Sword"
var damage: int = 10
var type: String = "Physical"

# Function to apply weapon effects on a character's stats
func apply_effect(character: CharacterBody2D):
	if type == "Physical":
		character.stats["attack"] += damage  # Increase attack stat by weapon's damage
	elif type == "Magic":
		character.stats["attack"] += damage * 2  # Example of a magic weapon effect
