extends Node

const MAX_PATH_LENGTH = 50

enum NEW_ITEM {SCENE, LOCATION, OBJECT, CHARACTER, EVENT, COUNT}
var btn_new_items = {
	NEW_ITEM.SCENE: 	{"icon": preload("res://assets/icon/material_sharp/image-24.png"), 			    "text": "Scene"		},
	NEW_ITEM.LOCATION: 	{"icon": preload("res://assets/icon/material_sharp/location-marker-24.png"),    "text": "Location"	},
	NEW_ITEM.OBJECT: 	{"icon": preload("res://assets/icon/material_sharp/orthogonal-view-24.png"),    "text": "Object"	},
	NEW_ITEM.CHARACTER: {"icon": preload("res://assets/icon/material_sharp/physics-24.png"), 		    "text": "Character"	},
	NEW_ITEM.EVENT: 	{"icon": preload("res://assets/icon/material_sharp/lightning-bolt-24.png"), 	"text": "Event"		},
	}

enum CONN {SCENE, INFO, FLAVOR, COUNT}
var connection_items = {
	CONN.SCENE: {"icon": preload("res://assets/icon/square-12.png")},
	}
