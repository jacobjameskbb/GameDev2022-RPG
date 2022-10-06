extends RigidBody2D

var active = false

func _ready():
	connect("body_entered",self,"on_NPC_body_entered")
	connect("body_exited",self,"on_NPC_body_exited")


func on_NPC_body_entered(body):
	if body.name == "player":
		active = true
		
func on_NPC_body_exited(body):
	if body.name == "player":
		active = false

#func _input(event):
#	if event.is_action_pressed("game_usage") and len(get_overlapping_bodies()) > 0:
#		find_and_use_dialogue()
		
func find_and_use_dialogue():
	var dialogue_player = get_node_or_null("DialoguePlayer")
	
	if dialogue_player:
		dialogue_player.play()
