#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ToolBarButtonTitleView : NSObject

+ (UIBarButtonItem *) rightButtonInitWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style target:( id)target  action:(SEL)action;

+ (UIView *) titleViewWithText:(NSString *) text;

+ (UIBarButtonItem *) leftButtonInitWithAction:(SEL)action target:( id)target;

+ (UIBarButtonItem *)rightButtonInitWithAction:(SEL)action target:(id)target image:(NSString *)imageName;

@end
