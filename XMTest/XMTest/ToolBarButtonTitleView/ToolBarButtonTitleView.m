#import "ToolBarButtonTitleView.h"

@implementation ToolBarButtonTitleView
+ (UIBarButtonItem *) rightButtonInitWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:( id)target  action:(SEL)action
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:style target:target action:action];
    [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16.0],NSFontAttributeName, nil] forState:UIControlStateNormal];

    [item setTintColor:[UIColor blackColor]];
    return item;
}

// 导航栏
+ (UIView *) titleViewWithText:(NSString *) text
{
    UILabel *navigationItemTitle = [[UILabel alloc] initWithFrame:CGRectMake(Screen_width / 2 - 32 , 0, 64, 44)];
    navigationItemTitle.text = text;
    navigationItemTitle.textAlignment = NSTextAlignmentCenter;
    if ([text isEqualToString:@"发现"] || [text isEqualToString:@"会诊"]) {
        navigationItemTitle.textColor = newRGB;
    }
    else
    {
        navigationItemTitle.textColor = rgb(51, 51, 51);
    }
    navigationItemTitle.font = [UIFont systemFontOfSize:16];
    if (iphone6Plus_5_5) {
        navigationItemTitle.font = [UIFont systemFontOfSize:18];

    }
    if (iphone6_4_7) {
        navigationItemTitle.font = [UIFont systemFontOfSize:17];
        
    }
    if (iphone5x_4_0) {
        navigationItemTitle.font = [UIFont systemFontOfSize:15];
    }
    return navigationItemTitle;
}

+ (UIBarButtonItem *) leftButtonInitWithAction:(SEL)action target:( id)target
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStyleDone target:target action:action];
    [item setImage:[UIImage imageNamed:@"back1"]];
    [item setTintColor:rgb(102, 102, 102)];
    return item;
}

+ (UIBarButtonItem *)rightButtonInitWithAction:(SEL)action target:(id)target image:(NSString *)imageName
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:target action:action];
    [item setImage:[UIImage imageNamed:imageName]];
    [item setTintColor:rgb(102, 102, 102)];
    return item;
}
@end
