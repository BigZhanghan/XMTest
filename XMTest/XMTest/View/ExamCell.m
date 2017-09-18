//
//  ExamCell.m
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import "ExamCell.h"
#import "AnswerCell.h"
#import "QuestionCell.h"
#import "UIView+ZHAdd.h"

@interface ExamCell ()<UITableViewDelegate,UITableViewDataSource>

//@property (nonatomic, strong) UILabel *titleL;

@property (nonatomic, strong) UITableView *examTableV;

@property (nonatomic, strong) NSMutableDictionary *dic;

@property (nonatomic, strong) NSMutableString *selectStr;


@end
@implementation ExamCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareLayout];
    }
    return self;
}

- (void)prepareLayout {
    
    self.dic = [NSMutableDictionary dictionary];
    
//    self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, Screen_width - 30, 40)];
//    self.titleL.font = myFont16;
//    self.titleL.textColor = MyBlackColor;
//    self.titleL.numberOfLines = 0;
//    self.titleL.lineBreakMode = NSLineBreakByCharWrapping;
//    
//    [self.contentView addSubview:self.titleL];
    
    self.examTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height - 50 - 64) style:UITableViewStylePlain];
    
    [self.contentView addSubview:self.examTableV];

    self.examTableV.delegate = self;
    
    self.examTableV.dataSource = self;
    
//    self.examTableV.scrollEnabled = NO;
    
    self.examTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    [self.examTableV registerClass:[AnswerCell class] forCellReuseIdentifier:@"AnswerCell"];
//    [self.examTableV registerClass:[QuestionCell class] forCellReuseIdentifier:@"QuestionCell"];
}

- (void)configCell:(Exam *)examModel index:(NSInteger)index {
    if (_examModel != examModel) {
        _examModel = nil;
        _examModel = examModel;
        _index = index;
        
        [self.examTableV reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.examModel.question_option.count + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return [QuestionCell getCellHeiht:self.examModel index:self.index];
    }
    else
    {
        return [AnswerCell getCellHeiht:self.examModel.question_option[indexPath.row-1]];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        QuestionCell *questionCell = [tableView dequeueReusableCellWithIdentifier:@"QuestionCell"];
        if (questionCell == nil) {
            questionCell = [[QuestionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QuestionCell"];
        }
        questionCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [questionCell configCell:self.examModel index:self.index];
        return questionCell;
    }
    else
    {
        AnswerCell *answerCell = [tableView dequeueReusableCellWithIdentifier:@"QuestionCell"];
        if (answerCell == nil) {
            answerCell = [[AnswerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QuestionCell"];
        }
        answerCell.selectionStyle = UITableViewCellSelectionStyleNone;
        Choices *choicesM = self.examModel.question_option[indexPath.row-1];
        
        if (!self.type) {
            for (NSString *anse in self.answer) {
                if ([anse isEqualToString:[choicesM.question_content substringToIndex:0]]) {
                    
                    choicesM.is_selected = YES;
                }
            }
        }
        
        answerCell.choicesM = choicesM;
        
        return answerCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return;
    }
    else
    {
        __block ExamCell *strongSelf = self;
        [self.examTableV deselectRowAtIndexPath:indexPath animated:YES];
        
        AnswerCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        self.selectStr = [NSMutableString string];
        
        NSMutableDictionary *answerDict = [NSMutableDictionary dictionary];
        
        if ([self.examModel.question_type isEqualToString:@"single"]) {
            
            [strongSelf.dic removeAllObjects];
            [cell selectBtnClickWithRow:indexPath.row-1 andModel:self.examModel andType:NO andFirst:NO block:^() {
                
                [strongSelf.dic setObject: [NSString stringWithFormat:@"%d", strongSelf.examModel.question_option[indexPath.row-1].is_selected] forKey:[NSString stringWithFormat:@"%ld",indexPath.row-1]];
                
                for (NSString *str in strongSelf.dic.allKeys) {
                    
                    if ([strongSelf.dic[str] isEqualToString:@"1"]) {
                        
                        //                        int num = [str intValue];
                        
                        //                        NSString *sele = [NSString stringWithFormat:@"%c",num + 65];
                        
                        if (str) {
                            
                            self.selectStr = [NSMutableString stringWithString:str];
                        }
                    }
                }
                
                [strongSelf.examTableV reloadData];
                
            }];
            //        [self.examTableV reloadData];
            
            /**
             *  单选: 这里每答一道题 进行保存 本地或者服务器
             */
            [answerDict setObject:[NSString stringWithFormat:@"%ld",(long)self.examModel.question_id] forKey:@"question_id"];
            [answerDict setObject:self.selectStr forKey:@"question_option"];
            
            
        }else {
            
            [self.dic removeAllObjects];
            for (NSInteger i = 0; i < self.examModel.question_option.count; i ++) {
                if (self.examModel.question_option[i].is_selected) {
                    [self.dic setObject:@"1" forKey:[NSString stringWithFormat:@"%ld",i]];
                }
            }
            NSLog(@"%@",self.dic);
            [cell selectBtnClickWithRow:indexPath.row-1 andModel:self.examModel andType:YES andFirst:!self.type block:^() {
                //                NSLog(@"dictPre === %@",strongSelf.dic);
                [strongSelf.dic setObject: [NSString stringWithFormat:@"%d", strongSelf.examModel.question_option[indexPath.row-1].is_selected] forKey:[NSString stringWithFormat:@"%ld",indexPath.row-1]];
                //                NSLog(@"dictSub === %@",strongSelf.dic);
                
                for (NSString *str in strongSelf.dic.allKeys) {
                    
                    if ([strongSelf.dic[str] isEqualToString:@"1"]) {
                        
                        //                        int num = [str intValue];
                        
                        //                        NSString *sele = [NSString stringWithFormat:@"%c",num + 65];
                        
                        if (str) {
                            
                            [self.selectStr appendFormat:@"%@,",str];
                        }
                    }
                }
                if (self.selectStr.length > 0) {
                    [self.selectStr deleteCharactersInRange:NSMakeRange(self.selectStr.length - 1, 1)];
                }
            }];
            
            /**
             *  多选 : 这里每答一道题 进行保存 本地或者服务器
             */
            
            [answerDict setObject:[NSString stringWithFormat:@"%ld",(long)self.examModel.question_id] forKey:@"question_id"];
            [answerDict setObject:self.selectStr forKey:@"question_option"];
            
        }
        self.type = YES;
        
        if (self.delegate) {
            [self.delegate selectAnswer:answerDict];
        }
        
        [self.examTableV reloadData];
    }
    
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
