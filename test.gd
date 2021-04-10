extends Node2D
var I_has
var I_aar

func _on_GetPlugin_pressed():
	I_has=Engine.has_singleton("PocketPlugin")
	if I_has:
		OS.alert("存在PocketPlugin单例")
		I_aar=Engine.get_singleton("PocketPlugin")
		$has.text="has=true"
		#I_aar.connect("adFailed",self,"InterAdFailed")
		#当可以获得奖励时
		I_aar.connect("VideoReward",self,"on_Reward")
		I_aar.connect("VideoClosed",self,"on_RewardClosed")
	else:
		OS.alert("不存在单利")
	pass 
#横幅广告加载失败
func InterAdFailed():
	$state.text="state:failed"
	pass
func _on_init_pressed():
	I_aar.init()
	pass # Replace with function body.

#静态广告
func _on_showad_pressed():
	I_aar.showInterAd()
	pass # Replace with function body.

#横幅广告
func _on_showBanner_pressed():
	#I_aar.showBanner()
	pass # Replace with function body.

#信息流广告
func _on_showNativeAd_pressed():
	I_aar.showNativeAd()
	pass # Replace with function body.

#激励视频广告
func _on_showRewardVideoAd_pressed():
	I_aar.showRewardVideoAd()
	pass # Replace with function body.
func on_Reward():
	OS.alert("获得激励视频的奖励")
	pass
func on_RewardClosed():
	OS.alert("关闭了激励视频")
	pass

