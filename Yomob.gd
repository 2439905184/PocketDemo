extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#appid用来初始化
#sceneId用来展示广告
export var appId:String
export var sceneId:PoolStringArray
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ShowAd_pressed():
	
	pass # Replace with function body.


func _on_Init_pressed():
	var _yomob=Engine.get_singleton("GodotYomob")
	OS.alert("是否有_yomob单例"+str(Engine.has_singleton("GodotYomob")))
	if _yomob:
		_yomob.init("66693598S65HJ3YTqYX1")
		_yomob.showAd("5390XujUetVDcp8w3R0")
		
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene("res://test.tscn")
	pass # Replace with function body.
