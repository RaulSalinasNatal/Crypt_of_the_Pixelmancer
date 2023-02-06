extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var healthBar = $healthBar
onready var staminaBar = $staminaBar
onready var attackBar = $attackBar
var recoveringStamina = false

func getHealthValue():
	return healthBar.value

func getAttackValue():
	return attackBar.value

func recoverStamina(boolean):
	self.recoveringStamina = boolean

func setHealth(health):
	healthBar.value = health

func setAttack(amount):
	attackBar.value = amount

func healthUpdate(health):
	healthBar.value += health

func updateAttackBar(amount):
	attackBar.value += amount

func maxHealthUpdate(maxHealth):
	healthBar.max_value = maxHealth

func setStamina(stamina):
	staminaBar.value = stamina

func staminaUpdate(stamina):
	staminaBar.value += stamina

	if staminaBar.value == staminaBar.max_value:
		recoveringStamina = false

func maxStaminaUpdate(maxStamina):
	staminaBar.max_value = maxStamina

func _ready():
	pass # Replace with function body.

func _process(delta):
	if recoveringStamina:
		staminaUpdate(1)
		

