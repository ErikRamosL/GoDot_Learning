extends KinematicBody2D
class_name actor


func _physics_process(delta):
	var velocity: = Vector2(300, 0)
	move_and_slide(velocity)
