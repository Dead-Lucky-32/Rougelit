extends Node2D

onready var cam = $Camera2D

const room = preload("res://Scenes/Rooms/BaseRoom.tscn")
const roomWidth = 350
const roomHeight = 640
const zoomMax = 5

export(int) var RoomsWidth = 1
export(int) var RoomsHeight = 1

var roomNumber = 0

func _ready():
	var xx = RoomsWidth
	var yy = RoomsHeight
	
	for n in range(xx):
		for nn in range(yy):
			roomNumber += 1
			print(str(n) + " , " + str(nn) + " Room Position: " + str(roomNumber))
			
			var WG = get_tree().current_scene
			var grabbedRoom = room.instance()
			WG.add_child(grabbedRoom)
			grabbedRoom.position.x = ((n) * roomWidth) 
			grabbedRoom.position.y = ((nn) * roomHeight)
			print(str(grabbedRoom.position.x) + " , " + str(grabbedRoom.position.y))
			

func _process(delta):
	if Input.is_action_just_pressed("zoomOut"):
		print("ZoomOut")
		if cam.zoom.x < zoomMax:
			cam.zoom.x += 1
			cam.zoom.y += 1
	
	if Input.is_action_just_pressed("ZoomIn"):
		print("ZoomIn")
		if cam.zoom.x > 1:
			cam.zoom.x -= 1
			cam.zoom.y -= 1
