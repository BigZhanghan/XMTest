//
//  ExamCell.h
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExamsModel.h"

@protocol SelectDelegate <NSObject>

- (void)selectAnswer:(NSDictionary *)answerDict;

@end

@interface ExamCell : UICollectionViewCell
@property (nonatomic, weak) id<SelectDelegate>delegate;

@property (nonatomic, strong) Exam *examModel;
@property (nonatomic, assign) NSInteger index;

@property (nonatomic, assign) BOOL type;

@property (nonatomic, strong) NSArray *answer;

@property (nonatomic, copy) void (^ExamBlock)(NSDictionary *dic);

- (void)configCell:(Exam *)examModel index:(NSInteger)index;
@end
