//
//  AnswerSheetController.m
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import "AnswerSheetController.h"
#import "ExamsModel.h"
#import "UILabel+ZHAdd.h"
#import "UIView+ZHAdd.h"

@interface AnswerSheetController ()

@end

@implementation AnswerSheetController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = backGrayColor;
    
    self.title = @"答题卡";
    
    self.navigationItem.leftBarButtonItem = [ToolBarButtonTitleView leftButtonInitWithAction:@selector(leftClickBack) target:self];
    self.navigationItem.rightBarButtonItem = [ToolBarButtonTitleView rightButtonInitWithTitle:@"确定交卷" style:UIBarButtonItemStyleDone target:self action:@selector(sureClick)];
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
    
    [self prepareLayout];
}

- (void)leftClickBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)prepareLayout {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, Screen_width, 60)];
    
    [self.view addSubview:titleLabel];
    
    titleLabel.backgroundColor = [UIColor whiteColor];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.font = myFont14;
    
    titleLabel.numberOfLines = 0;
    
    titleLabel.text = [NSString stringWithFormat:@"本试卷共有%ld道题,已答%ld道",(long)self.examList.question_list.count,self.answerArray.count];
    CGFloat lastBottom = titleLabel.bottom + 5;
    //    单选
    if (self.singleDic.allKeys.count != 0 && self.singleDic != nil) {
        
        UILabel *singleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.bottom + 5, Screen_width, 25)];
        
        [self.view addSubview:singleLabel];
        
        singleLabel.backgroundColor = [UIColor whiteColor];
        
        singleLabel.text = @"单选题";
        singleLabel.textAlignment = NSTextAlignmentCenter;
        
        singleLabel.font = myFont14;
        
        UIView *singleBgView = [[UIView alloc] init];
        
        singleBgView.backgroundColor = [UIColor colorWithRed:0.9334 green:0.9334 blue:0.9334 alpha:1.0];
        
        [self.view addSubview:singleBgView];
        
        NSInteger number = 1;
        
        UIButton *lastBtn = nil;
        for (int i = 0; i < self.singleDic.allKeys.count; i++) {
            
            UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
            
            [singleBgView addSubview:btn];
            
            CGFloat top;
            if(lastBtn == nil) {
                top = 10;
            } else if (lastBtn.right + 40 > Screen_width) {
                top = lastBtn.bottom + 10;
                number++;
            } else{
                top = lastBtn.top;
            }
            
            btn.frame = CGRectMake(lastBtn == nil ? 20 : lastBtn.right + 40 > Screen_width ? 20 : lastBtn.right + 20, top, 30, 30);
            
            btn.layer.cornerRadius = 15;
            
            [btn setBackgroundColor:[UIColor whiteColor]];
            
            [btn setTitle:[NSString stringWithFormat:@"%ld",[[self getSingleArray][i] integerValue] + 1] forState:(UIControlStateNormal)];
            
            Exam *exam = [self.singleDic objectForKey: [self getSingleArray][i]];
            for (NSDictionary *dic in self.answerArray) {
                
                if ([[NSString stringWithFormat:@"%ld",(long)exam.question_id] isEqualToString: [NSString stringWithFormat:@"%@",dic[@"question_id"]]]) {
                    
                    [btn setBackgroundColor: NewRedRGB];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    break;
                }
            }
            
            btn.tag = 1000 + [[self getSingleArray][i] integerValue];
            
            [btn addTarget:self action:@selector(listSelect:) forControlEvents:(UIControlEventTouchUpInside)];
            
            lastBtn = btn;
        }
        singleBgView.frame = CGRectMake(0, singleLabel.bottom + 5, Screen_width, number * 40 + 10);
        
        lastBottom = singleBgView.bottom + 5;
        
    }
    //    多选
    if (self.doubleDic.allKeys.count != 0 && self.doubleDic != nil) {
        
        UILabel *doubleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, lastBottom, Screen_width, 25)];
        
        [self.view addSubview:doubleLabel];
        
        doubleLabel.backgroundColor = [UIColor whiteColor];
        doubleLabel.textAlignment = NSTextAlignmentCenter;
        
        doubleLabel.text = @"多选题";
        
        doubleLabel.font = myFont14;
        
        UIView *doubleBgView = [[UIView alloc] init];
        
        doubleBgView.backgroundColor = [UIColor colorWithRed:0.9334 green:0.9334 blue:0.9334 alpha:1.0];
        
        [self.view addSubview:doubleBgView];
        
        NSInteger number = 1;
        
        UIButton *lastBtn = nil;
        for (int i = 0; i < self.doubleDic.allKeys.count; i++) {
            
            UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
            
            [doubleBgView addSubview:btn];
            
            CGFloat top;
            if(lastBtn == nil) {
                top = 10;
            } else if (lastBtn.right + 40 > Screen_width) {
                top = lastBtn.bottom + 10;
                number++;
            } else{
                top = lastBtn.top;
            }
            
            btn.frame = CGRectMake(lastBtn == nil ? 20 : lastBtn.right + 40 > Screen_width ? 20 : lastBtn.right + 20, top, 30, 30);
            
            btn.layer.cornerRadius = 15;
            
            [btn setBackgroundColor:[UIColor whiteColor]];
            
            [btn setTitle:[NSString stringWithFormat:@"%ld",[[self getDoubleArray][i] integerValue] + 1] forState:(UIControlStateNormal)];
            
            Exam *exam = [self.doubleDic objectForKey: [self getDoubleArray][i]];
            for (NSDictionary *dic in self.answerArray) {
                
                if ([[NSString stringWithFormat:@"%ld",(long)exam.question_id] isEqualToString: [NSString stringWithFormat:@"%@",dic[@"question_id"]]]) {
                    
                    [btn setBackgroundColor: NewRedRGB];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    break;
                }
            }
            
            btn.tag = 1000 + [[self getDoubleArray][i] integerValue];
            
            [btn addTarget:self action:@selector(listSelect:) forControlEvents:(UIControlEventTouchUpInside)];
            
            lastBtn = btn;
        }
        doubleBgView.frame = CGRectMake(0, doubleLabel.bottom + 5, Screen_width, number * 40 + 10);
        
    }
}

- (NSArray *)getSingleArray {
    
    return [self.singleDic.allKeys sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)getDoubleArray {
    
    return [self.doubleDic.allKeys sortedArrayUsingSelector:@selector(compare:)];
}

- (void)sureClick {
    [self submitExamResult];
}

- (void)submitExamResult
{
    if (self.answerArray.count == 0) {
        [self createAlertViewControllerWithTitle:@"温馨提示" message:@"尚未开始答题呢，是否确认交卷" cancel:@"继续考试" action:@"确认交卷" type:@"no_answer"];
    }
    else
    {
        if (self.answerArray.count < self.examList.question_list.count) {
            [self createAlertViewControllerWithTitle:@"温馨提示" message:@"试题尚未答完哦，是否确认交卷" cancel:@"继续考试" action:@"确认交卷" type:@"undo_answer"];
        }
        else
        {
            [self createAlertViewControllerWithTitle:@"温馨提示" message:@"已完成考试答题啦，是否确认交卷" cancel:@"取消" action:@"确认交卷" type:@"done_answer"];
        }
    }
    
}

//提交考试结果
- (void)requestForSubmitExam
{
    NSDictionary *dict = @{@"param_type":@"submit",@"user_id":self.user_id,@"subject_id":self.subject_id,@"examination_id":self.examList.examination_id,@"exam_content":[self jsonStringWithDictionary:self.answerArray]};
    [HttpClientTool newTl_requestWithActionName:EXAM_LIST params:dict SuccessBlock:^(id responseObject, NSString *code) {
        if ([responseObject[@"status"] isEqualToString:GOOD]) {
            NSDictionary *resultDict = responseObject[@"result"][0];
            NSLog(@"exam_result==%@",resultDict[@"exam_result"]);
            if ([resultDict[@"exam_result"] integerValue] <= 60) {
                [self createAlertViewControllerWithTitle:[NSString stringWithFormat:@"考试得分:%@",resultDict[@"exam_result"]] message:responseObject[@"desc"] cancel:nil action:@"默默承受" type:@"not_pass"];
            }
            else
            {
                [self createAlertViewControllerWithTitle:[NSString stringWithFormat:@"考试得分:%@",resultDict[@"exam_result"]] message:responseObject[@"desc"] cancel:nil action:@"申领证书" type:@"pass"];
            }
        }
        else
        {
            [hudTool showContent:@"考试交卷失败，请重试" inView:self.view withDuration:1.0];
        }
    } FailureBlock:^(NSError *error) {
        [hudTool showContent:@"请检查网络设置" inView:self.view withDuration:1.0];
    }];
}

- (void)listSelect:(UIButton *)btn {
    
    NSLog(@"%ld",btn.tag - 1000);
    
    self.AnswerSheetBlock(btn.tag - 1000);
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createAlertViewControllerWithTitle:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel action:(NSString *)action type:(NSString *)type
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle: UIAlertControllerStyleAlert];
    if (cancel.length == 0) {
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:action style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ([type isEqualToString:@"not_pass"]) {
                [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
            }
            else if ([type isEqualToString:@"pass"])
            {
                [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"pass_exam" object:nil];
            }
            else
            {
                [self requestForSubmitExam];
            }
        }];
        
        [alert addAction:action2];
        
    }
    else
    {
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:action style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if ([type isEqualToString:@"not_pass"]) {
                [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
            }
            else if ([type isEqualToString:@"pass"])
            {
                [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"pass_exam" object:nil];
            }
            else
            {
                [self requestForSubmitExam];
            }
        }];
        
        [alert addAction:action1];
        [alert addAction:action2];
    }
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

- (NSString *)jsonStringWithDictionary:(id)dictionary
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&parseError];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
