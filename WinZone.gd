extends Area2D

export var next_level = "Not_Set"
onready var player = $"../Player"
onready var globals = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	next_level = "res://maps/%s.tscn" % next_level
	connect("body_entered", self, "_on_WinZone_body_entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
# you spin me right round baby right round
func _process(delta):
	pass
	#$Sprite.rotation += .1
	#if $Sprite.rotation == 360:
	#	$Sprite.rotation = 0
	


func _on_WinZone_body_entered(body):
	if body.is_in_group("player"):
		print("PLAYER REACHED END\n")
		globals.player["lives"] += 1 # extra live per level
		get_tree().change_scene(next_level)