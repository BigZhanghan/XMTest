//
//  AnswerCell.m
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//


#import "AnswerCell.h"
#import "UIView+ZHAdd.h"

@interface AnswerCell ()

@end

static CGFloat defaultHeight = 40;
@implementation AnswerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self prepareLayout];
    }
    return self;
}

- (void)prepareLayout {

    
    self.choseBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    self.choseBtn.frame = CGRectMake(10, 5, 30, 30);
    
    [self.choseBtn setImage:[UIImage imageNamed:@"check3"] forState:(UIControlStateNormal)];
    [self.choseBtn setImage:[UIImage imageNamed:@"check4"] forState:(UIControlStateSelected)];
    
//    self.choseBtn.enabled = NO;
    self.choseBtn.userInteractionEnabled = NO;
    
    [self.contentView addSubview:self.choseBtn];
    
    self.contentL = [[UILabel alloc] initWithFrame:CGRectMake(self.choseBtn.right + 10, (defaultHeight - 16)/2, Screen_width - 60, 16)];
    self.contentL.textColor = MyBlackColor;
    self.contentL.numberOfLines = 0;
    self.contentL.font = myFont16;
    self.contentL.lineBreakMode = NSLineBreakByCharWrapping;
    [self.contentView addSubview:self.contentL];
}

- (void)setChoicesM:(Choices *)choicesM {
    if (_choicesM != choicesM) {
        _choicesM = nil;
        _choicesM = choicesM;
        NSString *answer = [NSString stringWithFormat:@"%@、%@",choicesM.question_option,choicesM.question_content];
        self.contentL.text = answer;
        CGFloat height = [self getHeightByWidth:Screen_width - 60 title:answer font:myFont16];
        CGRect contentFrame = self.contentL.frame;
        contentFrame.size.height = height;
        self.contentL.frame = contentFrame;
        
        CGPoint contentPoint = self.contentL.center;
        CGPoint chosePoint = self.choseBtn.center;
        chosePoint.y = contentPoint.y;
        self.choseBtn.center = chosePoint;
    }
    
    self.choseBtn.selected = choicesM.is_selected;
}

+ (CGFloat)getCellHeiht:(Choices *)choicesM
{
    CGFloat height = defaultHeight;
    NSString *answer = [NSString stringWithFormat:@"%@、%@",choicesM.question_option,choicesM.question_content];
    CGFloat contentHeight = [self getHeightByWidth:Screen_width - 60 title:answer font:myFont16];
    height = height - 16 + contentHeight;
    return height;
}

- (void)selectBtnClickWithRow:(NSInteger)row andModel:(Exam *)exam andType:(BOOL)type  andFirst:(BOOL)first block:(void(^)())block {
    if (!type) {
        for (Choices *choice in exam.question_option) {
            choice.is_selected = NO;
        }
    }
    if (first) {
        for (Choices *choice in exam.question_option) {
            choice.is_selected = NO;
        }

    }
    
    exam.question_option[row].is_selected = !exam.question_option[row].is_selected;
    
    block();
    
}

//自适应宽度
- (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}

//自适应高度
- (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    return [AnswerCell getHeightByWidth:width title:title font:font];
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

@end
