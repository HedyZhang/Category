//
//  ViewController.m
//  ActivityIndicatiorView
//
//  Created by 张海迪 on 14/12/28.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import "ViewController.h"
#import "IndicatiorView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IndicatiorView *aView = [[IndicatiorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    aView.center = self.view.center;
    [self.view addSubview:aView];
    [aView startAnimation];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
