extends CharacterBody3D

#class_name joe

signal toggle_inventory

@export var inventory_data: InventoryData

@onready var spring_arm_3d = $SpringArm3D
@onready var animation_player = $visuals/AnimationPlayer
@onready var visuals = $visuals
@onready var interact_ray = $SpringArm3D/Camera3D/InteractRay
@onready var camera_3d = $SpringArm3D/Camera3D


const SPEED = 28
const JUMP_VELOCITY = 8

@export var sens_horizontal = .08
@export var sens_vertical = .08

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var canJump = true
@onready var respawn_area = $"../respawnArea"
@onready var joystick = $"../CanvasLayer/HUD/virtual_joystick"


func _ready():
	#animPlayer.play("idle")
	$"../BGSfx".play()
	
	

func _input(event):
	if event is InputEventScreenDrag and joystick.ongoing_drag:
		rotate_y(deg_to_rad(event.relative.x* sens_horizontal))
		spring_arm_3d.rotate_x(deg_to_rad(event.relative.y* sens_vertical))

 

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	

	move_and_slide()


func _on_virtual_joystick_analogic_chage(move: Vector2):

	animation_player.play("Running_B")
	$run.play()
	var _direction = (transform.basis * Vector3(-move.x, 0 ,-move.y)).normalized()
	
	var target_position = position + -_direction
	if target_position != position:
		visuals.look_at(target_position)
	
	velocity.x = _direction.x * SPEED
	velocity.z = _direction.z * SPEED
	
	
	if velocity.x == _direction.x * 0:
		if velocity.z == _direction.y * 0:
			animation_player.play("Idle")
			$run.stop()
			
func _on_button_jump_pressed():
	# Handle Jump.
	var input_vector = Vector3()
	print("Jump button pressed")
	if is_on_floor() and canJump:
		animation_player.play("Jump_Full_Long")
		velocity.y = JUMP_VELOCITY
		input_vector.z += 1
			
		

		
func _on_obstacle_body_entered_(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scene/quest_panel.tscn")

#item

func _on_area_3d_body_entered(_body):
	if interact_ray.is_colliding():
		interact_ray.get_collider().player_interact()


func _on_interact_button_pressed() -> void:
	if interact_ray.is_colliding():
		#print("interact with", interact_ray.get_collider())
		interact_ray.get_collider().player_interact()


func get_drop_position() -> Vector3:
	var direction = -camera_3d.global_transform.basis.z
	return camera_3d.global_position + direction


#level 3



func _on_monkey_area_body_entered(_body):
	print("Player entered")
	if _body == self:
		print("Player entered ")
		# transfer
		$sparks.visible = true
		self.global_transform.origin = respawn_area.global_transform.origin 
		print("player respawn")
		print("Player position:", self.global_transform.origin)


func _on_respawn_area_body_exited(body):
	$sparks.visible = false
