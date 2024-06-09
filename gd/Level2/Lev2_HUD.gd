extends Control

var question


@onready var npc = $"../../npc/qg/CharacterBody3D2/AnimationPlayer"
@onready var respawn_area = $"../../respawnArea"



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





	



#Level 2




# npc
func _on_tans_1_pressed():
	$npc_dia/npc/D2.visible = true
	$npc_dia/npc/D1.visible = false
	$click.play()
	
	
func _on_trans_2_pressed():
	$npc_dia/plyr_npc/Player.visible = true
	$npc_dia/npc/D2.visible = false
	$click.play()
	
func _on_babaylan_area_area_entered(_area):
	$npc_dia/npc/D1.visible = true
	$click.play()
	
func _on_trans_player_pressed():
	$npc_dia/npc/D4.visible = true
	$npc_dia/plyr_npc/Player.visible = false
	$click.play()
func _on_trans_3_pressed():
	$npc_dia/npc/D3.visible = false
	$click.play()
	
func _on_trans_4_pressed():
	$npc_dia/plyr_npc/Player2.visible = true
	$npc_dia/npc/D4.visible = false
	$click.play()

func _on_trans_player_2_pressed():
	$npc_dia/npc/D3.visible = true
	$npc_dia/plyr_npc/Player2.visible = false


func _on_l_2_quest_area_area_entered(_area):
	$npc_dia/serpent/D1.visible = true
	$click.play()
	
func _on_tans_1_serpent_pressed():
	$npc_dia/serpent/D1.visible = false
	$npc_dia/plyr2/Player.visible = true
	$click.play()

func _on_player_tap_pressed():
	$npc_dia/serpent/D2.visible = true
	$npc_dia/plyr2/Player.visible = false
	
	$click.play()

func _on_trans_d_2_pressed():
	$npc_dia/serpent/D2.visible = false
	$npc_dia/plyr2/Player2.visible = true

func _on_button_pressed():
	$QuestPanel1.visible = false
	$QuestPanel2.visible = false
	$QuestPanel3.visible = false


func _on_right_ans_pressed():
	$QuestPanel1.visible = false
	$QuestPanel2.visible = false
	$QuestPanel3.visible = false
	$QuestPanel1/click.play()
	$right2.visible = true
	$right.play()
	$minimap.visible = false

func _on_wrng_ans_pressed():
	#$"dialogue/Quest Giver/Wrong/wrongAns1".visible = true
	$QuestPanel1.visible = false
	$QuestPanel1/click.play()
	$wrong2.visible = true
	$QuestPanel2.visible = false
	$wrong.play()
	$minimap.visible = false


func _on_right_2_pressed():
	$reward_video.play()
	$right2.visible = false
	$ButtonJump.visible = false
	$LVL2.visible = false
	$pause.visible = false
	$virtual_joystick.visible = false
	$reward_video/Label.visible = true
	$skip2.visible = true
	
func _on_reward_video_finished():
	$cutscenes.play()
	$reward_video/Label.visible = false

func _on_wrng_ans_2_pressed():
	$wrong3.visible = true
	$minimap.visible = false
	$wrong.play()
	$QuestPanel2.visible = false


func _on_wrong_3_pressed():
	$QuestPanel2.visible = false
	$QuestPanel2/click.play()
	$wrong3.visible = false
	$QuestPanel3.visible = true
	$question.play()


func _on_wrng_ans_3_pressed():
	$minimap.visible = false
	$QuestPanel3.visible = false
	$QuestPanel3/click.play()
	$wrong4.visible = true
	$QuestPanel3.visible = false
	$question.play()

func _on_wrong_4_pressed():
	$question.play()
	$QuestPanel3.visible = false
	$QuestPanel1/click.play()
	$wrong4.visible = false
	$QuestPanel1.visible = true


func _on_wrong_2_pressed():
	$QuestPanel2.visible = true
	$QuestPanel1/click.play()
	$question.play()
	$wrong2.visible = false

func _on_transd_3_pressed():
	$npc_dia/plyr2/Player2.visible = false
	$QuestPanel1.visible = true
	$question.play()


func _on_cutscenes_finished():
	Global3.load_scene("res://NewEnvi/Level3/scene/l3.tscn")
	$reward_video/Label.visible = false

func _on_buttonskip_pressed():
	Global3.load_scene("res://NewEnvi/Level3/scene/l3.tscn")
	$skip2/Buttonskipaa.visible = false


func _on_restart_pressed():
	Global.load_scene("res://scene/L2.tscn")


func _on_babaylan_area_area_exited(_area):
	$npc_dia/npc/D1.visible = false
	$npc_dia/npc/D2.visible = false
	$npc_dia/npc/D3.visible = false
	$npc_dia/npc/D4.visible = false
	$npc_dia/plyr_npc/Player.visible = false
	$npc_dia/plyr_npc/Player2.visible = false
	$click.play()
	

func _on_level_complte_pressed():
	$reward_video.play()


func _on_l_2_quest_area_area_exited(area):
	$click.play()
	$npc_dia/serpent/D1.visible = false
	$npc_dia/serpent/D2.visible = false
	$npc_dia/serpent/D3.visible = false
	$npc_dia/plyr2/Player.visible = false
	$npc_dia/plyr2/Player2.visible = false
