//
//  MBProgressHUDTool.h
//  xinzhangqu
//
//  Created by TONY on 15/6/26.
//  Copyright (c) 2015年 tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface MBProgressHUDTool : NSObject

@property(strong,nonatomic) MBProgressHUD *HUD;

+ (MBProgressHUDTool *)sharedInstance;
-(void)showContent:(NSString*)content inView:(UIView*)view withDuration:(NSTimeInterval)duration;

-(void)showSimpleInView:(UIView*)view;


@end
