//
//  ViewController.m
//  CustomCapture
//
//  Created by 张海迪 on 15/3/18.
//  Copyright (c) 2015年 haidi. All rights reserved.
//

#import "ViewController.h"
#import "CaptureViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *captureButton = [UIButton buttonWithType:UIButtonTypeSystem];
    captureButton.frame = CGRectMake(20, 50, 100, 50);
    [captureButton setTitle:@"照相机" forState:UIControlStateNormal];
    [captureButton addTarget:self action:@selector(capture:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:captureButton];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)capture:(UIButton *)button
{
    CaptureViewController * capture = [[CaptureViewController alloc] init];
    [self presentViewController:capture animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
