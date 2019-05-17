extends Node

onready var tree = find_node("Tree")
onready var tab_option := find_node("tab_option") as OptionButton
onready var tabContainer := find_node("TabContainer") as TabContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = tree.create_item()
	tree.set_hide_root(true)
	var child1 = tree.create_item(root)
	child1.set_text(0, "child1")
	var child2 = tree.create_item(root)
	child2.set_text(0, "child2")
	for i in range(10):
		var new_child = tree.create_item(child1)
		new_child.set_text(0, "subchild1_" + str(i))
	for i in range(10):
		var new_child = tree.create_item(child2)
		new_child.set_text(0, "subchild2_" + str(i))

	for c in tabContainer.get_children():
		tab_option.add_item(c.name)
	tab_option.connect("item_selected", self, "_on_tab_option_item_selected")

func _on_tab_option_item_selected(id):
	tabContainer.set_current_tab(id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
