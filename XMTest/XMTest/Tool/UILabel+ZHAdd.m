//
//  UILabel+ZHAdd.m
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import "UILabel+ZHAdd.h"

@implementation UILabel (DyfAdd)

+ (instancetype)customLablWithFrame:(CGRect)frame andTitle:(NSString *)text andFontNumber:(NSInteger)fontNumber {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    label.text = text;
    
    label.font = [UIFont systemFontOfSize:fontNumber];
    
    return label;
}
@end
