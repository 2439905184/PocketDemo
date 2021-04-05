extends Node2D
var I_has
var I_aar
func _on_Button_pressed():
	I_has=Engine.has_singleton("StrFromTest")
	if I_has:
		OS.alert("存在str from test单利")
		I_aar=Engine.get_singleton("StrFromTest")
		$has.text="has=true"
		I_aar.connect("adFailed",self,"InterAdFailed")
		#var a=I_aar.getStr()
		#OS.alert(a)
	else:
		OS.alert("不存在单利")
	pass

func InterAdFailed():
	$state.text="state:failed"
	pass
func _on_init_pressed():
	I_aar.init()
	pass # Replace with function body.


func _on_showad_pressed():
	I_aar.showInterAd()
	pass # Replace with function body.


func _on_showBanner_pressed():
	I_aar.showBanner()
	pass # Replace with function body.


func _on_showNativeAd_pressed():
	I_aar.showNativeAd()
	pass # Replace with function body.
