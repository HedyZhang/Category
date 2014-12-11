//
//  RootViewController.m
//  Category
//
//  Created by 张海迪 on 14-5-15.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import "RootViewController.h"
#import "NSArray+ArraySort.h"
#import "UIColor+HexColorString.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//     [UIColor colorFromHexRGB:@"ffffff"];
//   NSLog(@"%@", [UIColor HexRGBFromColor:[UIColor whiteColor]]);
    
    
//    
//    NSArray *ary = @[@(7), @(5), @(5), @(8), @(5), @(6), @(13), @(6), @(1)];
//    NSMutableArray * array = [NSMutableArray arrayWithArray:ary];
//
//    [NSArray quickSortWithArray:array startIndex:0 endIndex:ary.count - 1];
//    for (NSNumber *num in array) {
//        NSLog(@"%d", [num integerValue]);
//    }
    
//    NSArray *ary1 =[NSArray sortBlock:ary];
//    [ary1 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        NSLog(@"///////////////%d", [obj intValue]);
//    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
