//
//  ViewController.m
//  GridView
//
//  Created by yanshu on 15/4/29.
//  Copyright (c) 2015年 yanshu. All rights reserved.
//

#import "ViewController.h"
#import "GridView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *ary = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"];
    GridView *aView = [[GridView alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width - 20, 200) rowCount:4 columnCount:4];
    aView.dataSources = ary;
    [self.view addSubview:aView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
