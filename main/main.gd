extends Node

onready var btn_new := find_node("btn_new") as Button
onready var path_container := find_node("path_container") as HBoxContainer
onready var scene_graphedit := find_node("scene_graphedit") as GraphEdit

func _ready() -> void:
	set_up_new_btn()
	OS.low_processor_usage_mode = true
	btn_new.get_popup().connect("index_pressed", self, "_on_btn_new_node_pressed")
	path_container.set_path(["Storyname", "Scenename", "Locationname", "Objectname"])
	for i in range(constants.CONN.COUNT):
		scene_graphedit.add_valid_connection_type(i, i)
		scene_graphedit.add_valid_left_disconnect_type(i)
		scene_graphedit.add_valid_right_disconnect_type(i)
	scene_graphedit.connect("connection_request", self, "_on_scene_graphedit_connection_request")
	scene_graphedit.connect("disconnection_request", self, "_on_scene_graphedit_disconnection_request")

func set_up_new_btn():
	var new_menu_popup := btn_new.get_popup() as PopupMenu
	for i in range(constants.NEW_ITEM.COUNT):
		var info = constants.btn_new_items[i]
		new_menu_popup.add_icon_item(info["icon"], info["text"])

func _on_btn_new_node_pressed(index:int):
	match(index):
		constants.NEW_ITEM.SCENE:
			var new_node := GraphNode.new()
#			var contents := preload("res://icon.png") as Texture
#			var trect := TextureRect.new()
#			trect.texture = contents
			var contents = ColorRect.new()
			contents.color = Color.green
			contents.rect_min_size = Vector2(0, 50)
			new_node.add_child(contents)
			new_node.title = "TEST"
			new_node.show_close = true
			new_node.resizable = true
			new_node.set_slot(
				0, 
				true, constants.CONN.SCENE, Color.white,
				true, constants.CONN.SCENE, Color.red,
				constants.connection_items[constants.CONN.SCENE]["icon"],
				constants.connection_items[constants.CONN.SCENE]["icon"]
				)
			new_node.set_slot(
				1,
				true, constants.CONN.SCENE, Color.green,
				true, constants.CONN.SCENE, Color.blue,
				constants.connection_items[constants.CONN.SCENE]["icon"],
				constants.connection_items[constants.CONN.SCENE]["icon"]
				)
			new_node.connect("close_request", self, "_on_node_close_request", [new_node])
			new_node.connect("resize_request", self, "_on_node_resize_request", [new_node])
			scene_graphedit.add_child(new_node)

func _on_node_close_request(node:Node):
	node.queue_free()

func _on_node_resize_request(new_size:Vector2, node:GraphNode):
	node.rect_size.x = floor(new_size.x / scene_graphedit.snap_distance) * scene_graphedit.snap_distance
	node.rect_size.y = floor(new_size.y / scene_graphedit.snap_distance) * scene_graphedit.snap_distance

func _on_scene_graphedit_connection_request(from:String, from_slot:int, to:String, to_slot:int):
	scene_graphedit.connect_node(from, from_slot, to, to_slot)

func _on_scene_graphedit_disconnection_request(from:String, from_slot:int, to:String, to_slot:int):
	scene_graphedit.disconnect_node(from, from_slot, to, to_slot)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		print(scene_graphedit.get_connection_list())