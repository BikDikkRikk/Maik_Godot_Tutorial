extends Area2D


func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies() 
	# Waffe hat eine Hitbox die nicht kollidiert
	# get_overlapping_bodies schaut ob Hitboxen übereinander liegen
	# .size -> Wie viele Hitboxen überlappen
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range[0]
		look_at(target_enemy.global_position)

func shoot():
	const BULLET = preload("res://bullet.tscn") # Objekt wird vorgeladen
	var new_bullet = BULLET.instantiate() # .instantiate -> Objekt wird kreiert 
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet) #Kreiert Bullet Instanz unter Shooting_Point


func _on_timer_timeout():
	shoot()
