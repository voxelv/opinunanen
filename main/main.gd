extends Node

onready var btn_new_node := find_node("btn_new_node") as Button

func _ready() -> void:
	btn_new_node.connect("pressed", self, "_on_btn_new_node_pressed")

func _on_btn_new_node_pressed():
	print("Pressed the new button")
	pass


