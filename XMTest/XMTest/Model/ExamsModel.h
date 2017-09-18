//
//  ExamsModel.h
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Exam,Choices;
@interface ExamsModel : NSObject

//@property (nonatomic, strong) NSArray<Exam *> *objects;
//
//@property (nonatomic, assign) NSInteger isBegin;

@property (nonatomic, strong) NSString *subject_id;
@property (nonatomic, strong) NSString *examination_id;
@property (nonatomic, strong) NSString *examination_time;
@property (nonatomic, strong) NSString *examination_type;
@property (nonatomic, strong) NSArray<Exam *> *question_list;

@end
@interface Exam : NSObject

//@property (nonatomic, copy) NSString *vcType;
//
//@property (nonatomic, assign) NSInteger nCodeId;
//
//@property (nonatomic, assign) NSInteger nScore;
//
//@property (nonatomic, strong) NSArray<Choices *> *choices;
//
//@property (nonatomic, assign) NSInteger nTopicsId;
//
//@property (nonatomic, copy) NSString *vcAnswer;
//
//@property (nonatomic, copy) NSString *vcTitle;
//
//@property (nonatomic, assign) NSInteger nId;

@property (nonatomic, strong) NSArray<Choices *> *question_option;
@property (nonatomic, strong) NSString *question_type;
@property (nonatomic, strong) NSString *question_score;
@property (nonatomic, assign) NSInteger question_id;
@property (nonatomic, strong) NSString *question_desc;
@property (nonatomic, strong) NSString *question_name;

@end

@interface Choices : NSObject

//@property (nonatomic, assign) NSInteger nId;
//
//@property (nonatomic, assign) BOOL isSelect;
//
//@property (nonatomic, assign) NSInteger nContentId;
//
//@property (nonatomic, copy) NSString *vcAnswer;

@property (nonatomic, strong) NSString *question_id;
@property (nonatomic, strong) NSString *is_right;
@property (nonatomic, strong) NSString *question_content;
@property (nonatomic, strong) NSString *question_option;
@property (nonatomic, assign) BOOL is_selected;
@end

