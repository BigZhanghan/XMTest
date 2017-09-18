//
//  MBProgressHUDTool.m
//  xinzhangqu
//
//  Created by TONY on 15/6/26.
//  Copyright (c) 2015年 tony. All rights reserved.
//

#import "MBProgressHUDTool.h"

@interface MBProgressHUDTool()<MBProgressHUDDelegate>

@end

@implementation MBProgressHUDTool

static MBProgressHUDTool *_instance;
+ (MBProgressHUDTool *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

-(id)init
{
    
    self=[super init];
    if (self) {
    }
    return self;
}



-(void)showContent:(NSString*)content inView:(UIView*)view withDuration:(NSTimeInterval)duration
{
    _HUD = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:_HUD];
    _HUD.tag=11;
    _HUD.mode = MBProgressHUDModeCustomView;
    
    _HUD.opacity=0.5f;
    _HUD.delegate = self;
    _HUD.detailsLabelText = content;
    
    [_HUD show:YES];
    [_HUD hide:YES afterDelay:duration];

}

-(void)showSimpleInView:(UIView*)view
{
    // The hud will dispable all input on the view (use the higest view possible in the view hierarchy)
    _HUD = [[MBProgressHUD alloc] initWithView:view];
    _HUD.opacity=0.5f;
    _HUD.tag=22;
    [view addSubview:_HUD];
    
    // Regiser for HUD callbacks so we can remove it from the window at the right time
//    _HUD.delegate = self;
    [_HUD show:YES];
}

#pragma mark - MBProgressHUDDelegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [_HUD removeFromSuperview];
    _HUD = nil;
}
@end
