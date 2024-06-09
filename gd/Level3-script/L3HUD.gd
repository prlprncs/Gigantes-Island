extends Control

var question

@onready var respawn_area = $"../../respawnArea"

@onready var animation_NPC1 = $"../../npc/npc1/AnimationPlayer"
@onready var animation_NPC2 = $"../../npc2/npc1/AnimationPlayer"
@onready var animation_NPC3 = $"../../npc3/npc1/AnimationPlayer"




# Called when the node enters the scene tree for the first time.
func _ready():
	question = get_node("QuestPanel1/Quest/VBoxContainer/Q1")
	$QuestPanel3/Quest/VBoxContainer/Q3.text = "A giant's love, strong and true,
	For their wedding,
	He gathered things from distant lands
	But pirates came, love couldn't last.
	In sorrow, he cast them away,
	Above the sea, they still sway.
	
	What were those things, tossed in despair?"
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if question == answer:
	#	get_tree().change_scene_to_file("res://scene/Main.tscn")
	pass

func _on_button_close_panel_pressed():
	$QuestPanel1.visible = false
	$QuestPanel2.visible = false
	$QuestPanel3.visible = false
	


func _on_direction_pressed():
	$Direction.visible = false


func _on_pause_pressed():
	$pause/menu.visible = true


func _on_close_pressed():
	$pause/menu.visible = false


func _on_home_pressed():
	get_tree().change_scene_to_file("res://scene/MainMenu.tscn")


func _on_play_pressed():
	#get_tree().change_scene_to_file("res://scene/Level2.tscn")
	$pause/menu.visible = false


func _on_sound_pressed():
	$"../../Player/run".stop()
	$"../../BGSfx".stop()
	$pause/menu/mute.visible = true
	$pause/menu/Sound.visible = false


func _on_mute_pressed():
	$"../../Player/run".play()
	$"../../BGSfx".play()
	$pause/menu/mute.visible = false
	$pause/menu/Sound.visible = true

#exited

func _on__area_exited(_area):
	print("exit")
	animation_NPC1.play("Idle")
	$dialogue/npc3.visible = false
	

func _on_level_complte_pressed():
	$reward_video.play()
	$ButtonJump.visible = false
	$"Lvl-3".visible = false
	$pause.visible = false
	$virtual_joystick.visible = false
	$"level complete".visible = false
	$InvUI.visible = false
	$reward_video/Label.visible = true
	$minimap.visible = false
	$skip.visible = true
	





#quest
func _on_l_3_area_area_entered(_area):
	$"dialogue/Quest Giver/D1".visible = true
	$"pick up".play()
	
func _on_wrng_ans_3_pressed():
	$wrong4.visible = true
	$QuestPanel3.visible = true
	$question.play()
	$wrong.play()
	


#item
func _on_shell_2_area_entered(_area):
	$"../../item/shell".visible = true
	$"pick up".play()

func _on_bottle_2_area_entered(_area):
	$"../../item/box2".visible = true
	$"pick up".play()
	
func _on_coconut_area_entered(_area):
	$"level complete".visible = true
	$"pick up".play()
	$pause.visible = false
	$virtual_joystick.visible = false
	$ButtonJump.visible = false
	$"Lvl-3".visible = false
	$minimap.visible = false
	$InvUI.visible = false
	
#npc
func _on_npc_area_area_entered(_area):
	$dialogue/npc1.visible = true
	animation_NPC1.play("Interact")
	
func _on_transparent_pressed():
	$dialogue/npc1.visible = false
	$dialogue/npc2.visible = false
	$dialogue/npc3.visible = false
	animation_NPC1.play("Idle")
	$QuestPanel1/click.play()

func _on_npc_area_area_exited(_area):
	$dialogue/npc1.visible = false
	animation_NPC1.play("Idle")


func _on_ans_pressed():
	$levelComplte.visible = true


func _on_wrng_pressed():
	$"../../item/box".visible = true
	$QuestPanel3.visible = false


func _on_button_pressed():
	$QuestPanel1.visible = false
	$QuestPanel2.visible = false
	$QuestPanel3.visible = false
	$QuestPanel1/click.play()

func _on_right_ans_pressed():
	$right2.visible = true
	$QuestPanel1.visible = false
	$QuestPanel2.visible = false
	$QuestPanel3.visible = false
	$right.play()
	$minimap.visible = false
	$"../../BGSfx".stop()
	$"../../Player/run".stop()

func _on_wrng_ans_pressed():
	$wrong2.visible = true
	$QuestPanel1.visible = false
	$wrong.play()

func _on_wrong_2_pressed():
	$QuestPanel2.visible = true
	$QuestPanel1/click.play()
	$question.play()
	$wrong2.visible = false
	$question.play()


func _on_wrng_ans_2_pressed():
	$wrong3.visible = true
	$QuestPanel2.visible = false
	$question.play()
	$wrong.play()


func _on_wrong_3_pressed():
	$QuestPanel1/click.play()
	$wrong3.visible = false
	$QuestPanel3.visible = true
	$question.play()
	


func _on_wrong_4_pressed():
	$QuestPanel1/click.play()
	$wrong4.visible = false
	$"dialogue/Quest Giver/Wrong/wrongAns1".visible = true
	$QuestPanel3.visible = false



func _on_right_2_pressed():
	$reward_video.play()
	$right2.visible = false
	$ButtonJump.visible = false
	$"Lvl-3".visible = false
	$pause.visible = false
	$virtual_joystick.visible = false
	$reward_video/Label.visible = true
	$reward_video/Label.visible = true
	$skip.visible = true

func _on_reward_video_finished():
	$cutscenes.play()
	$reward_video/Label.visible = false
	
	
	


func _on_tans_1_pressed():
	$dialogue/plyr/Player.visible = true
	$"dialogue/Quest Giver/D1".visible = false
	$QuestPanel1/click.play()

func _on_trans_player_pressed():
	$"dialogue/Quest Giver/D2".visible = true
	$dialogue/plyr/Player.visible = false
	$QuestPanel1/click.play()


func _on_trans_2_pressed():
	$dialogue/plyr/Player2.visible = true
	$"dialogue/Quest Giver/D2".visible = false
	$QuestPanel1/click.play()


func _on_trans_player_2_pressed():
	$QuestPanel1.visible = true
	$dialogue/plyr/Player2.visible = false
	$QuestPanel1/click.play()


func _on_cutscenes_finished():
	$finalCin.play()
	$cutscenes.stop()
	$skip2.visible = false
	


func _on_wrng_dia_1_pressed():
	$"dialogue/Quest Giver/Wrong/wrongAns1".visible = false
	$dialogue/plyr/Wrng1.visible = true
	$QuestPanel1/click.play()


func _on_plyr_wrng_dia_1_pressed():
	$dialogue/plyr/Wrng1.visible = false
	$"dialogue/Quest Giver/Wrong/wrongAns".visible = true
	$QuestPanel1/click.play()


func _on_wrng_dia_2_pressed():
	$"dialogue/Quest Giver/Wrong/wrongAns".visible = false
	$dialogue/plyr/Wrng2.visible = true
	$QuestPanel1/click.play()


func _on_plyr_wrng_dia_2_pressed():
	$dialogue/plyr/Wrng2.visible = false
	$"dialogue/Quest Giver/Wrong/wrongAns2".visible = true
	$QuestPanel1/click.play()
	


func _on_wrng_dia_3_pressed():
	$"dialogue/Quest Giver/Wrong/wrongAns2".visible = false
	$"../../item/box".visible = true
	$QuestPanel1/click.play()
	$"../../npc".queue_free()
	$"../../npc2".queue_free()
	$"../../npc3".queue_free()
	$"../../quest place".queue_free()


func _on_buttonskipaa_pressed():
	$skip2.visible = false
	$finalCin.play()
	$cutscenes.stop()
	$skip3.visible = true
	
	


func _on_npc_area_1_area_entered(area):
	$dialogue/npc2.visible = true
	$QuestPanel1/click.play()
	animation_NPC2.play("Interact")


func _on_npc_area_1_area_exited(area):
	$dialogue/npc2.visible = false
	animation_NPC2.play("Idle")
		


func _on_npc_area_2_area_entered(area):
	$dialogue/npc3.visible = true
	$QuestPanel1/click.play()
	animation_NPC3.play("Interact")
	


func _on_npc_area_2_area_exited(area):
	$dialogue/npc3.visible = false
	animation_NPC3.play("Idle")
	


func _on_level_complte_2_pressed():
	$"level complete".visible = false
	$reward_video.visible = true
	$reward_video/Label.visible = true
	$InvUI.visible = false
	$skip.visible = true
	$minimap.visible = false
	


func _on_buttonskip_pressed():
	$reward_video.queue_free()
	$cutscenes.play()
	$skip.visible = false
	$skip2.visible = true


func _on_restart_pressed():
	Global3.load_scene("res://scene/l3.tscn")


func _on_final_cin_finished():
	get_tree().change_scene_to_file("res://scene/MainMenu.tscn")
	$skip3.visible = false


func _on_skkii_pressed():
	get_tree().change_scene_to_file("res://scene/MainMenu.tscn")
	


func _on_l_3_area_area_exited(area):
	$"dialogue/Quest Giver/D1".visible = false
	$"dialogue/Quest Giver/D2".visible = false
	$"dialogue/Quest Giver/D3".visible = false
	$dialogue/plyr/Player.visible = false
	$dialogue/plyr/Player2.visible = false
