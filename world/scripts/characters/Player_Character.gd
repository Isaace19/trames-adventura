###################################
# Name: Isaac Abella
# Description: Class PlayerCharacter inherits BaseCharacter, this script
# will include player inventory, level up and experience system, and should give direct control to the user
###################################

extends "res://scripts/characters/Base_Character.gd"

class_name Player_Character

var inventory: Array = []

# set a max inventory size for my sanity
var max_inventory: int = 10

# function to check if item is in inventory
func has_item(item: String)-> bool:
		return item in inventory

# function to add items to inventory
func add_item(item: String) -> bool:
		if inventory.size() >= max_inventory:
				print("Inventory is currently full")
				return false
		inventory.append(item)
		print(item, "Added to inventory!")
		return true

# function to remove items from inventory
func remove_item(item: String) -> bool:
		if item in inventory:
				iventory.erase(item)
				print(item, "Removed from inventory!")
				return true
		print(item, "not found in inventory!")
		return false

# function to list all of the items in your inventory
func show_inventory():
		print("Inventory:", inventory)


# function to use items such as potions, add to later...
func use_item(item: String):
		if not has_item(item):
				print("You don't have a", item)
				return
		if item == "Potion":
				stats["health" += 20]
				print("You used a Potion! Your health is now: ", stats["health"])
				remove_item(item)
