//
//  TestViewController.m
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import "TestViewController.h"
#import "ExamsModel.h"
#import "ExamCell.h"
#import "AnswerSheetController.h"
#import <MJExtension/MJExtension.h>
#import "UIView+ZHAdd.h"

@interface TestViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SelectDelegate>

@property (nonatomic,strong) UICollectionView *collectionV;
@property (nonatomic, strong) ExamsModel *examsM;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) NSMutableArray *answerArray;
/**
 *  当前的位置
 */
@property (nonatomic, strong) NSIndexPath *indexPathNow;
@end

@implementation TestViewController
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    self.fd_interactivePopDisabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = backGrayColor;
    self.navigationItem.titleView = [ToolBarButtonTitleView titleViewWithText:@"开始考试"];
    self.navigationItem.leftBarButtonItem = [ToolBarButtonTitleView leftButtonInitWithAction:@selector(leftClickBack) target:self];
    self.navigationItem.rightBarButtonItem = [ToolBarButtonTitleView rightButtonInitWithTitle:@"交卷" style:UIBarButtonItemStyleDone target:self action:@selector(commitClick)];
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
    
    [self prepareLayout];
    [self getSourceData];
}

- (void)leftClickBack
{
    [self createAlertViewControllerWithTitle:@"温馨提示" message:@"考试还没结束，是否放弃考试" cancel:@"放弃考试" action:@"继续考试" type:@"back"];
}

//获取考试试题
- (void)getSourceData
{
    NSDictionary *dict = @{@"param_type":@"getlist",@"user_id":self.user_id,@"subject_id":self.subject_id};
    [HttpClientTool newTl_requestWithActionName:EXAM_LIST params:dict SuccessBlock:^(id responseObject, NSString *code) {
        if ([responseObject[@"status"] isEqualToString:GOOD]) {
            NSDictionary *resultDict = responseObject[@"result"][0];
            self.examsM = [ExamsModel mj_objectWithKeyValues:resultDict];
        }
        else
        {
            [hudTool showContent:@"获取试卷失败，请重试" inView:self.view withDuration:1.0];
        }
        [self.collectionV reloadData];
    } FailureBlock:^(NSError *error) {
        [hudTool showContent:@"请检查网络设置" inView:self.view withDuration:1.0];
    }];
}

- (void)prepareLayout {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    
    self.layout .scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.layout .itemSize = CGSizeMake(Screen_width, Screen_height - 64 - 50);
    
    self.collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, Screen_width, Screen_height - 64 - 50) collectionViewLayout:self.layout];
    
    self.collectionV.backgroundColor = [UIColor whiteColor];
    
    self.collectionV.showsVerticalScrollIndicator = NO;
    
    self.collectionV.showsHorizontalScrollIndicator = NO;
    
    self.collectionV.delegate = self;
    
    self.collectionV.dataSource = self;
    
    self.collectionV.pagingEnabled = YES;
    
    self.collectionV.userInteractionEnabled = YES;
    
    [self.collectionV registerClass:[ExamCell class] forCellWithReuseIdentifier:@"ExamCell"];
    
    [self.view addSubview:self.collectionV];
    
    UIView *bottomBgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.collectionV.bottom, Screen_width, 50)];
    
    bottomBgView.backgroundColor = NewRedRGB;
    
    [self.view addSubview:bottomBgView];
    
    CGFloat buttonWidth = 80;
    
    UIButton *left = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    left.frame = CGRectMake(0, 0, buttonWidth, 50);
    
    [left setTintColor:[UIColor whiteColor]];
    
    [left setTitle:@"上一题" forState:(UIControlStateNormal)];
    
    [bottomBgView addSubview:left];
    
    [left addTarget:self action:@selector(upSelectClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    left.tag = 998;
    
    
    UIButton *right = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    right.frame = CGRectMake(Screen_width - buttonWidth, 0, buttonWidth, 50);
    
    [right setTintColor:[UIColor whiteColor]];
    
    [right setTitle:@"下一题" forState:(UIControlStateNormal)];
    
    [bottomBgView addSubview:right];
    
    [right addTarget:self action:@selector(downSelectClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    right.tag = 999;
    
    
}

#pragma mark - delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.examsM.question_list.count > 0) {
        return self.examsM.question_list.count;
    }
    else
    {
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ExamCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ExamCell" forIndexPath:indexPath];
    cell.delegate = self;
    //根据题号取得答案
    if (self.examsM.question_list.count > 0) {
        [cell configCell:self.examsM.question_list[indexPath.item] index:indexPath.item];
    }
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
    
}

#pragma mark - button-click

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGPoint pInView = [self.view convertPoint:self.collectionV.center toView:self.collectionV];
    
    self.indexPathNow = [self.collectionV indexPathForItemAtPoint:pInView];
    
}

//上一题
- (void)upSelectClick {
    
    if (self.indexPathNow.row > 0) {
        
        [self.collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.indexPathNow.item - 1 inSection:self.indexPathNow.section] atScrollPosition:(UICollectionViewScrollPositionNone) animated:YES];
        
        self.indexPathNow = [NSIndexPath indexPathForItem:self.indexPathNow.item - 1 inSection:self.indexPathNow.section];
        
        [self.collectionV reloadData];
        
    }else {
        NSLog( @"已经是第一题了");
    }
    
}
//下一题
- (void)downSelectClick {
    
    if (self.indexPathNow.row < self.examsM.question_list.count - 1) {
        
        [self.collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.indexPathNow.item + 1 inSection:self.indexPathNow.section] atScrollPosition:(UICollectionViewScrollPositionNone) animated:YES];
        
        self.indexPathNow = [NSIndexPath indexPathForItem:self.indexPathNow.item + 1 inSection:self.indexPathNow.section];
        
        [self.collectionV reloadData];
    }else {
        [hudTool showContent:@"当前已是最后一题，快交卷吧" inView:self.view withDuration:1.0];
        NSLog(@"已经是最后一题了" );
    }
    
}

- (void)selectAnswer:(NSDictionary *)answerDict
{
    for (NSDictionary *dict in self.answerArray) {
        if ([dict[@"question_id"] isEqualToString:answerDict[@"question_id"]]) {
            [self.answerArray removeObject:dict];
            break;
        }
    }
    if ([answerDict[@"question_option"] length] > 0) {
        [self.answerArray addObject:answerDict];
    }
    NSLog(@"%lu---%@",(unsigned long)self.answerArray.count,self.answerArray);
}

- (void)commitClick {
    //单选
    NSMutableDictionary *singleDic = [NSMutableDictionary dictionary];
    //多选
    NSMutableDictionary *doubleDic = [NSMutableDictionary dictionary];
    
    for (Exam *exam in self.examsM.question_list) {
        if ([exam.question_type isEqualToString:@"single"]) {
            
            
            [singleDic setObject:exam forKey:@([self.examsM.question_list indexOfObject:exam])];
            
        }else {//多选
            
            [doubleDic setObject:exam forKey:@([self.examsM.question_list indexOfObject:exam])];
            
        }
    }
    
    __block TestViewController *strongSelf = self;
    
    /**
     * 跳转到答题卡 这里应该请求数据 获取到已答题
     *
     * 或者答题的时候 自己保存已答题
     */
    
    
    
    AnswerSheetController *answerSheet = [AnswerSheetController new];
    
    answerSheet.examList = self.examsM;
    
    answerSheet.singleDic = singleDic;
    
    answerSheet.doubleDic = doubleDic;
    
    answerSheet.answerArray = self.answerArray;
    
    answerSheet.subject_id = self.subject_id;
    
    answerSheet.user_id = self.user_id;
    
    answerSheet.AnswerSheetBlock = ^(NSInteger row) {
        [strongSelf.collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:row inSection:0] atScrollPosition:(UICollectionViewScrollPositionNone) animated:YES];
        CGPoint pInView = [self.view convertPoint:self.collectionV.center toView:self.collectionV];
        self.indexPathNow = [self.collectionV indexPathForItemAtPoint:pInView];
    };
    
    
    [self.navigationController pushViewController:answerSheet animated:YES];
    
    
}

- (void)createAlertViewControllerWithTitle:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel action:(NSString *)action type:(NSString *)type
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:action style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}

- (NSMutableArray *)answerArray
{
    if (!_answerArray) {
        _answerArray = [NSMutableArray array];
    }
    return _answerArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
