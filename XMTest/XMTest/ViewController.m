//
//  ViewController.m
//  XMTest
//
//  Created by 张涵 on 2017/8/31.
//  Copyright © 2017年 张涵. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = backGrayColor;
    self.navigationItem.titleView = [ToolBarButtonTitleView titleViewWithText:@"我的证书"];
    [self createUI];
}

- (void)createUI
{
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(0, 0, Screen_width - 40, 44);
    testBtn.center = self.view.center;
    testBtn.layer.masksToBounds = YES;
    testBtn.layer.cornerRadius = 22.0;
    testBtn.backgroundColor = [UIColor colorWithRed:252/255.0f green:19/255.0f blue:104/255.0f alpha:1.0f];
    [testBtn setTitle:@"开始考试" forState:UIControlStateNormal];
    [testBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(startTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
}

- (void)startTest
{
    TestViewController *test = [[TestViewController alloc] init];
    test.subject_id = @"42";
    test.user_id = @"71";
    [self.navigationController pushViewController:test animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
