extends Node2D

	
func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	
	%PathFollow2D.progress_ratio = randf() 
	# Zufällige Position auf dem Path
	# Das Node Pathfollow2D kreiert einen Punkt auf Path2D (ig)
	
	new_mob.global_position = %PathFollow2D.global_position
	new_mob.set_platform_floor_layers(0)
	add_child(new_mob)
	

func spawn_tree():
	var new_tree = preload("res://pine_tree.tscn").instantiate()
	
	%PathFollow2D.progress_ratio = randf() 
	# Zufällige Position auf dem Path
	# Das Node Pathfollow2D kreiert einen Punkt auf Path2D (ig)
	
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)
	
	
func _on_tree_timer_timeout():
	spawn_tree()

func _on_mob_timer_timeout():
	spawn_mob()
	
	
func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true

	
	
