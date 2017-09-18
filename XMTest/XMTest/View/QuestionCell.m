//
//  QuestionCell.m
//  洵美
//
//  Created by 张涵 on 2017/9/5.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import "QuestionCell.h"

@implementation QuestionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self prepareLayout];
    }
    return self;
}

- (void)prepareLayout {
    
    self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, Screen_width - 30, 40)];
    self.titleL.font = myFont16;
    self.titleL.textColor = MyBlackColor;
    self.titleL.numberOfLines = 0;
    self.titleL.lineBreakMode = NSLineBreakByCharWrapping;
    
    [self.contentView addSubview:self.titleL];
}

- (void)configCell:(Exam *)examModel index:(NSInteger)index {
    if (_examModel != examModel) {
        _examModel = nil;
        _examModel = examModel;
        
        NSString *type = nil;
        if ([examModel.question_type isEqualToString:@"single"]) {
            type = @"单选";
        }
        else
        {
            type = @"多选";
        }
        NSString *titleString = [NSString stringWithFormat:@"[%@] %ld.%@", type,index+1,examModel.question_name];
        self.titleL.text = titleString;
        CGFloat height = [self getHeightByWidth:Screen_width - 30 title:titleString font:myFont16];
        CGRect titleFrame = self.titleL.frame;
        titleFrame.size.height = height + 30;
        self.titleL.frame = titleFrame;
    }
}

+ (CGFloat)getCellHeiht:(Exam *)choicesM index:(NSInteger)index
{
    CGFloat height = 0;
    NSString *type = nil;
    if ([choicesM.question_type isEqualToString:@"single"]) {
        type = @"单选";
    }
    else
    {
        type = @"多选";
    }
    NSString *titleString = [NSString stringWithFormat:@"[%@] %ld.%@", type,index+1,choicesM.question_name];
    CGFloat contentHeight = [self getHeightByWidth:Screen_width - 30 title:titleString font:myFont16];
    height = height + contentHeight + 30;
    return height;
}

//自适应高度
- (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    return [QuestionCell getHeightByWidth:width title:title font:font];
}

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
