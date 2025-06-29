extends CharacterBody2D
var overt1: bool
var overt2: bool
func _physics_process(delta: float) -> void:
	velocity.y = Global.npc_car_speed
	move_and_slide()
	if position.y > 2500:
		self.queue_free()
func _on_crush_control_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		Global.player_hp -= 1
		Global.score -= 5
		
func _on_overtaking_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		overt1 = true
	else:
		overt1 = false
