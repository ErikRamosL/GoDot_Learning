extends Area2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

var score: = 100

func _on_body_entered(body):
	picked()


func picked():
	anim_player.play("fade_out")
	PlayerData.score += score
