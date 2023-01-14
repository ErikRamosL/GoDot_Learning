extends Control


onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay
onready var score : Label = $Label
onready var paused_title: Label = $PauseOverlay/Title


var paused: = false setget set_paused


func _ready():
	PlayerData.connect("score_updated", self, "User_Interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()


func _on_PlayerData_player_died():
	self.paused = true
	paused_title.text = "You Died"


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()


func update_interface():
	score.text = "Score %s" % PlayerData.score


func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
