//
//  AnswerSheetController.h
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExamsModel.h"

@interface AnswerSheetController : UIViewController
/**
 *  试卷信息
 */
@property (nonatomic, strong) ExamsModel *examList;
/**
 *  答案
 */
@property (nonatomic, strong) NSArray *answerArray;
/**
 *  单选
 */
@property (nonatomic, strong) NSMutableDictionary *singleDic;
/**
 *  多选
 */
@property (nonatomic, strong) NSMutableDictionary *doubleDic;
//课程id
@property (nonatomic, strong)NSString *subject_id;
//用户id
@property (nonatomic, strong)NSString *user_id;

@property (nonatomic, copy) void (^AnswerSheetBlock)(NSInteger row);
@end
