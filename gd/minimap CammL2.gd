extends Camera3D


@onready var player = $"../../../../../Player"






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Vector3(player.position.x, position.y, player.position.z)
