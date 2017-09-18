//
//  common.h
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#ifndef common_h
#define common_h

#define hudTool [MBProgressHUDTool sharedInstance]

//提供Apple的测试账号
#define Test_Id @"18018550010"
#define isTestAccount [[UserTool sharedManager].model.user_account isEqualToString:Test_Id]

#define DEV 0
#if DEV
//V1.0基本接口地址
#define MyBaseUrl @"http://ios.app.meirendaifu.com:54968/service/"
//V2.0基本接口地址
#define MyNewBaseUrl @"http://order.meirendaifu.com:51888/service/"
//支付基本URL
#define PAY_BASEURL @"http://order.meirendaifu.com:54969/service/"
#else
//V1.0基本接口地址
#define MyBaseUrl @"http://video.meirendaifu.com:54968/service/"
//V2.0基本接口地址
#define MyNewBaseUrl @"http://order.meirendaifu.com:51888/service/"
//支付基本URL
#define PAY_BASEURL @"http://order.meirendaifu.com:54969/service/"
#endif

//上传图片地址
#define UpLoadImageUrl @"http://img.meirendaifu.com:8880/"
//获取分享链接地址
#define ShareUrl @"http://activity.meirendaifu.com:8888/activity/share"
//分享页地址
#define SharePageUrl @"http://activity.meirendaifu.com:8080/xunmei/share.html"


/***
 *  登录
 ***/
//获取验证码
#define GET_VERIFY_CODE @"loginService?methods=gettelchecknum"
/*更换绑定手机号*/
//验证旧手机号
#define VERIFI_OLD_PHONE @"personalService?methods=validateOldTel"
//验证新手机号
#define VERIFI_NEW_PHONE @"personalService?methods=bingdingNewTel"

#define CHANGE_PW @"loginService?methods=changePwd"
// 登录
#define LOGIN @"loginService?methods=login"
// 注册
#define REGISTER @"loginService?methods=register"
// 获取个人信息
#define GETMYINFO @"personalService?methods=getpersonInfo"
/**
 *  头像上传
 */
///
#define uploadImage @"file/fileupload"

//生成图片名
#define FileName @"_file.png"


/***
 *  首页
 ***/
// 首页banner、cost、free
#define HOME_DETAIL @"indexService?methods=getIndex"
// 首页-课程列表
#define COURSE_LIST @"courseService?methods=getcourselist"
// 首页- 免费课程
#define Free_List @"courseService?methods=getfreeList"
// 首页- 精品课程
#define Cost_List @"courseService?methods=getcostList"
// 首页-Banner
#define HomeBanner @"bannerService?methods=getbannerlist"
// 首页- 免费-更多
#define HomeFreeDetail @"courseService?methods=getfreebycatlegory"
// 首页- 精品-更多
#define HomeCostDetail @"courseService?methods=getcostbycatlegory"
// 首页- 精品-详情
#define HOMEDetail @"courseService?methods=getCourseDetailById"
// 首页- 播放历史
#define HOMEPLAYLIST @"courseService?methods=getPlayRecordList"
//生成播放记录
#define PLAYHISTORY @"courseService?methods=createPlayRecord"
//课程搜索
#define SEARCHCOURSE @"courseService?methods=searchCourse"


// 课程

/***
 *  发现
 ***/
// 获取优惠券
#define GETCOUPONS @"couponService?methods=getCoupons"
// 获取我的优惠券
#define MYCOUPONS @"couponService?methods=getCoupons"
// 获取通知列表
#define GETMESSAGES @"messageService?methods=getMessages"
// 获取会议列表
#define GETMeetings @"meetingService?methods=getMeetings"
// 领取优惠券
#define OBTAINCOUPONS @"couponService?methods=receiveCoupons"


/***
 *  我的
 ***/
// 我的证书
#define MYCERTIFICATION @"personalService?methods=getCertificationList"

#define APPLYCERT @"authenticationService?methods=applyCertification"
// 修改个人信息
#define CHANGEMYINFO @"personalService?methods=modifyPersonInfo"
//获取个人信息设置部分列表
#define GETINFOTABLE @"personalService?methods=getOptionList"

// 我的购买记录
#define MYBUYRECORD @"personalService?methods=getBuyedRecord"
//取消订单
#define CANCLEORDER @"orderService?methods=cancelOrder"

//支付订单生成
#define PAY_ORDER @"orderService?methods=getOrderInfo"

//支付结果查询
#define PAY_RESULT @"orderService?methods=getPayResult"

// 意见反馈
#define FeedBack @"personalService?methods=giveFeedback"

//我的
//我的账户/账户明细
#define MY_ACCOUNT @"doctorService/account"
//保证金充值
#define DEPOSIT_RECHARGE (PAY_BASEURL @"payService/getorderinfo")
//保证金充值结果查询
#define DEPOSIT_RECHARGE_RESULT (PAY_BASEURL @"payService/payresult")
//我的账户提现、退押金
#define ACCOUNT_TRANSFER (PAY_BASEURL @"transferService/transfer")

//我的
//医生认证
#define DoctorAuth @"doctorService/authentication2"
//获取医生认证状态
#define DOCTOR_VERIFY_STATUS @"doctorService/authentication/check"
//获取医生认证信息
#define DOCTOR_INFO @"doctorService/authentication/info"
//获取技能列表
#define GET_SKILLS @"doctorService/goodpoint"
//修改技能
#define CHANGE_SKILLS @"doctorService/alter/goodpoint"


//开发票
//获取可以开票的列表
#define INVOICE_LIST @"invoiceService"
//获取考试列表和提交考试结果
#define EXAM_LIST @"examService"

//订单
//获取订单列表
#define ORDER_LIST @"orderService/list"
//医生接单
#define ACCESS_ORDER @"doctorService/order"
//医生退单
#define Cancle_Order @"chargeBackService/chargeback"
//医生退单
#define CANCLE_ORDER (MyNewBaseUrl @"chargeBackService/static/page")

//SDK
//AlipaySDK
#define Alipay_AppId @"alipay2017032606411429"
//微信AppId
#define WeChat_AppId @"wxc3877be07560513b"
//QQAppId
#define QQ_AppId @"1105262049"
//极光推送AppId
#define JPush_AppId @"2b1a8804bfd87145c5155889"
//
#define UMeng_AppKey @"5950b88f1c5dd010b2001116"

/**
 *  iOS系统版本
 *
 *  @param  iOSx
 *
 *  @return currentVersion
 */
#define ios8x [[[UIDevice currentDevice] systemVersion] floatValue] >=8.0f

#define ios7x ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)

#define ios6x [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0f

#define iosNot6x [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f

#define SystemVersion   [[[UIDevice currentDevice] systemVersion] floatValue]

/**
 *  颜色设置
 *
 *  @param r red
 *  @param g green
 *  @param b blue
 *
 *  @return color
 */
#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

#define rgba(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define backGrayColor [UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f]

#define MyBlackColor [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f]

#define MyGrayColor [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1.0f]

#define LineColor [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1.0f]

#define newRGB [UIColor colorWithRed:218/255.0f green:175/255.0f blue:95/255.0f alpha:1.0f]

#define NewRedRGB [UIColor colorWithRed:252/255.0f green:19/255.0f blue:104/255.0f alpha:1.0f]

/**
 *
 *  @return UIControlStateNormal
 */
#define stateNormal UIControlStateNormal


/**
 *  屏幕大小
 *
 *  @return size
 */
#define kScreenFrame [UIScreen mainScreen].bounds

#define kScreenSize [UIScreen mainScreen].bounds.size

#define APPDelegate [UIApplication sharedApplication].delegate

#define Screen_width [[UIScreen mainScreen] bounds].size.width

#define Screen_height [[UIScreen mainScreen] bounds].size.height

/**
 *  尺寸大小
 *
 *  @return iphone X
 */
#define iphone4x_3_5 ([UIScreen mainScreen].bounds.size.height==480.0f)

#define iphone5x_4_0 ([UIScreen mainScreen].bounds.size.height==568.0f)

#define iphone6_4_7 ([UIScreen mainScreen].bounds.size.height==667.0f)

#define iphone6Plus_5_5 ([UIScreen mainScreen].bounds.size.height==736.0f || [UIScreen mainScreen].bounds.size.height==414.0f)

#define myFont12 [UIFont systemFontOfSize:12]

#define myFont13 [UIFont systemFontOfSize:13]

#define myFont14 [UIFont systemFontOfSize:14]

#define myFont15 [UIFont systemFontOfSize:15]

#define myFont16 [UIFont systemFontOfSize:16]

#define myFont17 [UIFont systemFontOfSize:17]

//Button height
#define BUTTON_HEIGHT 44




#define TAG_LOADINGVIEW  90000
#define TAG_MESSAGEVIEW  90001
#define TAG_MODALVIEW  90002
#define TAG_LODINGDATA  90003
/**
 *  创建单例
 *
 *  @param className singleton_interface
 *
 *  @return object
 */
//.h
#define singleton_interface(className)\
\
+(className*)shared##className;
//.m
#define singleton_implementation(className)\
\
static className *_instance; \
+ (className *)shared##className\
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}\
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
}


#define NSNOTIFICATION [NSNotificationCenter defaultCenter]
// 微信支付完成无论成功还是失败
#define WXPAYDONE              @"WXPayDone"
// 微信支付成功
#define WXPaySuccess           @"WXPaySuccess"

#define WEICHAT_LOGIN                     @"weiChatLogin"

#define WEICHATCHATSHARESUCCESS           @"weiChatShareSuccess"

#define kWXAPP_ID                         @"wxe9b1cd9b4afc4acf"

#define KQQAPP_ID @"1111768146"

#define KQQAPP_Key  @"YXwp94jfDYARQuzT"

#define NOTI_CHANGE_USERINFO @"change_user_info"

//斜线连接时间格式
#define yyyyMMdd_solidus           @"yyyy/MM/dd"
#define yyyyMMddHHmm_solidus       @"yyyy/MM/dd HH:mm"
#define yyyyMMddHHmmss_solidus     @"yyyy/MM/dd HH:mm:ss"
//直线连接时间格式
#define yyyyMMdd_straight          @"yyyy-MM-dd"
#define yyyyMMddHHmm_straight      @"yyyy-MM-dd HH:mm"
#define yyyyMMddHHmmss_straight    @"yyyy-MM-dd HH:mm:ss"

#endif /* common_h */
