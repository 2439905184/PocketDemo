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
		I_aar.connect("staticAdFailed",self,"_on_InterAdFailed")
		I_aar.connect("nativeAdClosed",self,"_on_showFullAd_closed")
		I_aar.connect("nativeAdFailed",self,"_on_showFullAd_failed")
	else:
		OS.alert("不存在单利")
	pass 
#静态广告加载失败
func _on_InterAdFailed():
	$state.text="静态广告加载失败"
	OS.alert("静态广告加载失败")
	pass
func _on_init_pressed():
	I_aar.init()
	pass # Replace with function body.

#静态广告
func _on_showad_pressed():
	I_aar.showInterAd()
	pass # Replace with function body.

#信息流广告
func _on_showNativeAd_pressed():
	I_aar.showNativeAd()
	pass # Replace with function body.

#激励视频广告
func _on_showRewardVideoAd_pressed():
	I_aar.showRewardVideoAd()
	pass 
func on_Reward():
	OS.alert("获得激励视频的奖励")
	pass
func on_RewardClosed():
	OS.alert("关闭了激励视频")
	pass
#播放全屏广告
func _on_showFullAd_pressed():
	I_aar.showNativeAd()
	pass 
func _on_showFullAd_closed():
	alert_closed("全屏广告")
	pass
func _on_showFullAd_failed():
	alert_failed("全屏广告")
	pass
func alert_closed(ad_type:String):
	OS.alert(ad_type+"广告被关闭")
	pass
func alert_failed(ad_type:String):
	OS.alert(ad_type+"广告播放失败")
	pass
