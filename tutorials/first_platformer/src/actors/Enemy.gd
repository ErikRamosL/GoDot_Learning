extends "res://src/actors/actor.gd"


onready var stomp_area: Area2D = get_node("StompDetector")


var score: = 100


func _ready():
	set_physics_process(false)
	_velocity.x = -speed.x


func _on_StompDetector_body_entered(body:PhysicsBody2D):
	if body.global_position.y > stomp_area.global_position.y:
		return
	die()


func _physics_process(delta):
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y


func die():
	queue_free()
	PlayerData.score += score
