extends Control

var question

@onready var animation_player1 = $"../../stalls/1/CharacterBody3D/AnimationPlayer"
@onready var animation_player2 = $"../../stalls/2/CharacterBody3D2/AnimationPlayer"
@onready var animation_player3 = $"../../stalls/3/CharacterBody3D/AnimationPlayer"
@onready var animation_playerQG = $"../../stalls/mainQuest/questPlace/CharacterBody3D/AnimationPlayer"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#if question == answer:
	#	get_tree().change_scene_to_file("res://scene/Main.tscn")
	pass

func _on_button_close_panel_pressed():
	$QuestPanel1.visible = false
	$virtual_joystick.visible = true 
	$ButtonJump.visible = true
	$"Jump1(1)".visible = true
	$pause/menu/close/close.play()
	$QuestPanel2.visible = false
	$QuestPanel3.visible = false
	
func _on_yes_pressed():
	$QuestPanel1.visible = true
	$choice.visible = false

func _on_no_pressed():
	$choice.visible = false
	

func _on_direction_pressed():
	$Direction.visible = false
	$Direction/click.play()


func _on_pause_pressed():
	$pause/menu.visible = true
	$Direction/click.play()

func _on_close_pressed():
	$pause/menu.visible = false
	$pause/menu/close/close.play()


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
	$"../right".stop()
	$"../question".stop()
	$"../wrong".stop()


func _on_area_3d_area_entered(_area):
	print("entered")
	$dialogue/npc1.visible = true
	animation_player1.play("Interact")
	$QuestPanel1/click.play()

func _on_area_3d_area_exited(_area):
	print("exit")
	animation_player2.play("Interact")
	$QuestPanel1/click.play()
	
func _on__area_entered(_area):
	print("entered")
	$QuestPanel1/click.play()
	animation_playerQG.play("Interact")
	$dialogue/npc2.visible = true

	
func _on_quest_area_area_entered(_area):
	print("entered")
	$"dialogue/Quest Giver/D1".visible = true
	animation_player3.play("Interact")
	$QuestPanel2/click.play()
	$"dialogue/Quest Giver".visible = true
	
	

func _on_npc_3_area_entered(_area):
	$QuestPanel1/click.play()
	animation_player3.play("Interact")
	print("entered")
	$dialogue/npc3.visible = true
	
	
#exited

func _on__area_exited(_area):
	print("exit")
	animation_playerQG.play("Idle")
	$dialogue/npc3.visible = false
	$QuestPanel1/click.play()
	
func _on_quest_area_area_exited(_area):
	print("exit")
	$"dialogue/Quest Giver/D1".visible = true
	animation_playerQG.play("Idle")
	#$"../../stalls/mainQuest/questPlace/questArea".queue_free()
	#$"../../stalls/mainQuest/questPlace/chest".visible = true
	#$"../../item".visible = true
	$QuestPanel1/click.play()
	
func _on_npc_3_area_exited(_area):
	animation_player3.play("Idle")
	$dialogue/npc3.visible = false
	print("exit")
	$QuestPanel1/click.play()

func _on_level_complte_pressed():
	$"../reward_video".play()
	$right.visible = false
	$ButtonJump.visible = false
	$"Level Name".visible = false
	$pause.visible = false
	$virtual_joystick.visible = false
	$"level complete".visible = false
	$skip2.visible = true
	$InvUI.visible = false
	$"../../BGSfx".stop()
	$"../../Player/run".stop()
	$"../reward_video/Label".visible = true
	
func _on_area_3_area_exited(_area):
	animation_player1.play("Idle")
	$dialogue/npc1.visible = false
	$QuestPanel1/click.play()


func _on_area_2_area_exited(_area):
	$QuestPanel1/click.play()
	animation_player2.play("Idle")
	$dialogue/npc2.visible = false


#npc dialogue
func _on_transparent_pressed():
	$dialogue/npc1.visible = false
	$dialogue/npc2.visible = false
	$dialogue/npc3.visible = false
	$QuestPanel1/click.play()
	

func _on_tans_1_pressed():
	$dialogue/plyr/Player.visible = true
	$"dialogue/Quest Giver/D1".visible = false
	$QuestPanel1/click.play()


func _on_trans_player_pressed():
	$"dialogue/Quest Giver/D2".visible = true
	$dialogue/plyr/Player.visible = false
	$QuestPanel1/click.play()


func _on_trans_2_pressed():
	$"dialogue/Quest Giver/D2".visible = false
	$QuestPanel1.visible = true
	$"../question".play()

#L1 Wrong ans Dialogue
func _on_wrng_dia_1_pressed():
	$dialogue/plyr/Wrng1.visible = true
	$"dialogue/Quest Giver/Wrong/wrongAns1".visible = false
	$QuestPanel1/click.play()
	
	
func _on_plyr_wrng_dia_1_pressed():
	$"dialogue/Quest Giver/Wrong/wrongAns".visible = true
	$dialogue/plyr/Wrng1.visible = false
	$QuestPanel1/click.play()
	
func _on_wrng_dia_2_pressed():
	$dialogue/plyr/Wrng2.visible = true
	$"dialogue/Quest Giver/Wrong/wrongAns".visible = false
	$QuestPanel1/click.play()

func _on_plyr_wrng_dia_2_pressed():
	$"dialogue/Quest Giver/Wrong/wrongAns2".visible = true
	$dialogue/plyr/Wrng2.visible = false
	$QuestPanel1/click.play()
	
func _on_wrng_dia_3_pressed():
	$"dialogue/Quest Giver/Wrong/wrongAns2".visible = false
	$"../../item/box".visible = true
	$"../../stalls/1".queue_free()
	$"../../stalls/2".queue_free()
	$"../../stalls/3".queue_free()
	$"../../stalls/mainQuest".queue_free()


#item inventory
func _on_shell_2_area_entered(_area):
	$"../../item/shell".visible = true
	$"../pick".play()

func _on_bottle_2_area_entered(_area):
	$"../../item/box2".visible = true
	$"../pick".play()
	
	
func _on_coconut_area_entered(_area):
	$"level complete".visible = true
	$ButtonJump.visible = false
	$"Level Name".visible = false
	$pause.visible = false
	$virtual_joystick.visible = false
	$InvUI.visible = false
	$minimap.visible = false
	$"../pick".play()
	
	
	
#q1 answer button 
func _on_right_ans_pressed():
	$QuestPanel1.visible = false
	$QuestPanel2.visible = false
	$QuestPanel3.visible = false
	$QuestPanel1/click.play()
	$right.visible = true
	$minimap.visible = false
	
	
func _on_wrng_ans_pressed():
	#$"dialogue/Quest Giver/Wrong/wrongAns1".visible = true
	$QuestPanel1.visible = false
	$QuestPanel1/click.play()
	$wrong.visible = true
	$QuestPanel2.visible = false
	$"../wrong".play()

func _on_wrong_pressed():
	$QuestPanel2.visible = true
	$QuestPanel1/click.play()
	$"../question".play()
	$wrong.visible = false
	$"../../BGSfx".stop()
	
func _on_button_pressed():
	$QuestPanel1.visible = false
	$QuestPanel2.visible = false
	$QuestPanel3.visible = false

func _on_right_pressed():
	$"../reward_video".play()
	$"../reward_video/Label".visible = true
	$right.visible = false
	$ButtonJump.visible = false
	$"Level Name".visible = false
	$pause.visible = false
	$virtual_joystick.visible = false
	$skip2.visible = true
	$minimap.visible = false
	$"../../BGSfx".stop()

func _on_reward_video_finished():
	$"../cutscenes".play()
	$skip.visible = true
	$"../reward_video".stop()
	$skip2.visible = false
	$"../reward_video/Label".visible = false
	
	

func _on_wrng_ans_2_pressed():
	$wrong2.visible = true
	$"../wrong".play()
	$QuestPanel2.visible = false


func _on_wrong_2_pressed():
	$QuestPanel2.visible = false
	$QuestPanel1/click.play()
	$wrong2.visible = false
	$QuestPanel3.visible = true
	$"../question".play()
	


func _on_wrng_ans_3_pressed():
	$QuestPanel3.visible = false
	$QuestPanel1/click.play()
	$wrong3.visible = true
	$"../wrong".play()
	


func _on_wrong_3_pressed():
	$QuestPanel1/click.play()
	$wrong3.visible = false
	$"dialogue/Quest Giver/Wrong/wrongAns1".visible = true
	$"../../BGSfx".stop()
	$"../../Player/run".stop()

func _on_level_complte_2_pressed():
	$"level complete/levelComplte".visible = false
	$"../reward_video".visible = true
	$"../reward_video/Control".visible = true
	$InvUI.visible = false
	$"../reward_video/Label".visible = true


func _on_cutscenes_finished():
	Global2.load_scene("res://scene/L2.tscn")
	


func _on_restart_pressed():
	Global.load_scene("res://scene/L1.tscn")


func _on_buttonskip_pressed():
	Global2.load_scene("res://scene/L2.tscn")
	$"../cutscenes".queue_free()
	$skip.visible = false
	

func _on_buttonskipaa_pressed():
	$"../cutscenes".play()
	$skip.visible = true
	$"../reward_video".queue_free()
	$skip2.visible = false
