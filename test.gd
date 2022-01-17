extends Node2D
var I_has
var PocketAD
#banner广告id 请修改掉默认的id（默认的只能测试）
#激励id
export var reward_scene_id = "2"
#静态插屏id
export var inter_sceene_id = "6"
#全屏广告id
export var full_scene_id = "7"
#Banner广告id 
export var banner_scene_id = "3"
#原生广告id
export var native_scene_id = "16"
func _on_GetPlugin_pressed():
	I_has=Engine.has_singleton("PocketPlugin")
	if I_has:
		$has.text="has=true"
		OS.alert("存在PocketPlugin单例")
		PocketAD=Engine.get_singleton("PocketPlugin")
		#激励信号链接
		PocketAD.connect("RewardGet",self,"on_RewardGet")
		PocketAD.connect("RewardClosed",self,"on_RewardClosed")
		PocketAD.connect("RewardFailed",self,"on_RewardFailed")
		#静态插屏信号链接
		PocketAD.connect("InterAdSuccess",self,"on_InterAdSuccess")
		PocketAD.connect("InterAdClosed",self,"on_InterAdClosed")
		PocketAD.connect("InterAdFailed",self,"on_InterAdFailed")
		#全屏广告信号链接
		PocketAD.connect("FullAdSuccess",self,"on_FullAdSuccess")
		PocketAD.connect("FullAdClosed",self,"on_FullAdClosed")
		PocketAD.connect("FullAdFailed",self,"on_FullAdFailed")
		#Banner广告信号连接
		PocketAD.connect("BannerAdSuccess",self,"on_BannerAdSuccess")
		PocketAD.connect("BannerAdClosed",self,"on_BannerAdClosed")
		PocketAD.connect("BannerAdFailed",self,"on_BannerAdFailed")
		#原生广告信号链接
		PocketAD.connect("NativeAdClosed",self,"on_NativeAdClosed")
		PocketAD.connect("NativeAdFailed",self,"on_NativeAdFailed")
	else:
		OS.alert("不存在单利")
	pass
#----展示广告--------
#展示激励广告
func _on_showRewardVideoAd_pressed():
	PocketAD.showRewardVideoAd(reward_scene_id)
	pass
#展示静态广告
func _on_showInter_pressed():
	PocketAD.showInterAd(inter_sceene_id)
	pass
#播放全屏广告 
#注意 此方法未在插件实现展示广告！
func _on_showFullAd_pressed():
	PocketAD.showFullAd(full_scene_id)
	pass 
#展示Banner广告
func _on_showBanner_pressed():
	PocketAD.showNativeAd(native_scene_id)
	pass
#展示信息流广告 (原生）
func _on_showNativeAd_pressed():
	PocketAD.showNativeAd()
#----信号处理-----
#激励
func on_RewardGet():
	OS.alert("获得激励视频的奖励")
	pass
func on_RewardClosed():
	OS.alert("关闭了激励视频")
	pass
func on_RewardFailed():
	OS.alert("激励视频播放失败！")
	pass
#静态插屏广告
func on_InterAdSuccess():
	$state.text="静态插屏播放成功！"
	OS.alert("静态插屏播放成功！")
	pass
func on_InterAdClosed():
	$state.text="静态广告被关闭"
	OS.alert("静态插屏被关闭")
	pass
func on_InterAdFailed():
	$state.text="静态广告加载失败"
	OS.alert("静态广告加载失败")
	pass
#全屏视频广告
func on_FullAdSuccess():
	OS.alert("全屏广告播放成功！")
	pass
func on_FullAdClosed():
	OS.alert("全屏广告关闭！")
	pass
func on_FullAdFailed():
	OS.alert("全屏广告播放失败！")
	pass
#Banner广告
func on_BannerAdSuccess():
	OS.alert("Banner广告播放成功！")
	pass
func on_BannerAdClosed():
	OS.alert("Banner广告被关闭")
	pass
func on_BannerAdFailed():
	OS.alert("Banner广告播放失败！")
	pass
#原生广告
func on_NativeAdClosed():
	OS.alert("原生广告被关闭")
	pass
func on_NativeAdFailed():
	OS.alert("原生广告播放失败！")
	pass
#func _on_init_pressed():
#	PocketAD.init()

