//
//  ExamsModel.m
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import "ExamsModel.h"

@implementation ExamsModel


+ (NSDictionary *)objectClassInArray{
    return @{@"question_list" : [Exam class]};
}
@end
@implementation Exam

+ (NSDictionary *)objectClassInArray{
    return @{@"question_option" : [Choices class]};
}

@end


@implementation Choices

@end


