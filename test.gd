extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# warning-ignore:unused_signal
signal a
var has
# Called when the node enters the scene tree for the first time.
func _ready():
	has=Engine.has_singleton("HelloGodot")
	#OS.alert("有单例吗"+str(has))
	$Label.text+=str(has)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_test_pressed():
	var _hello=Engine.get_singleton("HelloGodot")
	$Label2.text=str(_hello)
	#print_tree_pretty()
	if _hello:
		OS.alert("有Hello单例")
		var array=_hello.get_method_list()
		for i in array:
			$Label3.text=str(i)
		#hello.test()
		pass
		#hello.connect("on_test",self,"_test")
	pass # Replace with function body.

func _test():
	$Label3.text="HelloFromAndroidPlugin"
	pass
func _on_Node2D_a():
	pass # Replace with function body.
