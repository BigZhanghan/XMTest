//
//  AnswerCell.h
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExamsModel.h"

@interface AnswerCell : UITableViewCell

@property (nonatomic, strong) UIButton *choseBtn;

@property (nonatomic, strong) UILabel *contentL;

@property (nonatomic, strong) Choices *choicesM;
/**
 *  @param row  点击的行数
 *  @param exam 试题demo
 *  @param type 单选为no
 *  @param first  yes 第一次点击 重置多选按钮
 */
- (void)selectBtnClickWithRow:(NSInteger)row andModel:(Exam *)exam andType:(BOOL)type andFirst:(BOOL)first block:(void(^)())block;
+ (CGFloat)getCellHeiht:(Choices *)choicesM;
@end
