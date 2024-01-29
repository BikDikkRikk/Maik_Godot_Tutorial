extends Area2D

var travelled_distance = 0
func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	# Bullet fliegt in die Richtung in die sie rotiert ist
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free() #Löscht Objekt nach einem Frame


func _on_body_entered(body):
	# dieser Code wird ausgeführt wenn die Bullet etwas triffe
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
		#wenn ein Objekt die Funktion take_damage hat, wird diese ausgeführt
		
