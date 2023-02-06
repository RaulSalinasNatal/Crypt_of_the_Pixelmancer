extends "res://scenes/enemies/enemy.gd"

var tankedHits = 0
var dodgeHits = 1
var playerPos
var targetPos 
var waitTime = 0.5
var ogSpeed = speed
var mult = 0.5
var ogMult = 0.5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	playerPos = player.getPos()
	directionToPlayer = self.position.direction_to(playerPos)
	
	targetPos = player.getPos()
	rotation = targetPos.angle_to_point(position)
	
	var weapon = player.currentWeapon
	
	if waitTime > 0:
		waitTime -= delta
	else:
		if (weapon == 1):
			speed = ogSpeed + 5
		else:
			mult = ogMult + 0.5
		
		if GlobalVariables.difficulty == "Easy":
			movement = directionToPlayer * speed * mult * delta
		if GlobalVariables.difficulty == "Normal":
			match(tankedHits):
				1: movement = directionToPlayer * speed * (1.5+mult) * delta
				2: movement = directionToPlayer * speed * (2.5+mult) * delta
				_: movement = directionToPlayer * speed * delta
		if GlobalVariables.difficulty == "Hard":
			match(tankedHits):
					1: movement = directionToPlayer * speed * (2+mult) * delta
					2: movement = directionToPlayer * speed * (3+mult) * delta
					_: movement = directionToPlayer * speed * delta
		
		move_and_collide(movement)


func _on_kamikazeHitbox_area_entered(area):
	if "Attack" in area.name:
		tankedHits += 1;
		$Sprite.scale *= 1.4
		
	
	if tankedHits == 3 or "SA_Area" in area.name:
		createExplosion()
		createExplosion()
		createExplosion()
		updatePlayerSouls(50)
		updateAttackBar(10)
		queue_free()

	if "pjHitbox" in area.name:
		speed = 0
		createExplosion()
		updateAttackBar(10)
		queue_free()
