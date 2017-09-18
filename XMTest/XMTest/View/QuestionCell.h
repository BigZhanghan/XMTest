//
//  QuestionCell.h
//  洵美
//
//  Created by 张涵 on 2017/9/5.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExamsModel.h"

@interface QuestionCell : UITableViewCell
@property (nonatomic, strong) Exam *examModel;
@property (nonatomic, strong) UILabel *titleL;
- (void)configCell:(Exam *)examModel index:(NSInteger)index;
+ (CGFloat)getCellHeiht:(Exam *)choicesM index:(NSInteger)index;
@end
