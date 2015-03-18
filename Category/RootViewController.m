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
#import "UIView+Animation.h"
#import "HDSharedViewController.h"
@interface RootViewController ()
@property (strong, nonatomic) IBOutlet UIView *aView;

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
//    NSMutableArray *sortArray1 = [NSMutableArray arrayWithObjects:@(4), @(6),@(5), @(8),@(9), @(3), nil];
//    [NSArray quickSortWithArray:sortArray1 startIndex:0 endIndex:(sortArray1.count - 1)];
//    NSLog(@"----%@", sortArray1);
//    int a[] = {4,6,5,8,9,3};
//    insertSort(a, 6);
//    bubbleSort(a, 6);
//    for (int k = 0; k < 6; k++)
//    {
//        printf("%d  ", a[k]);
//    }
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageView.image = [UIImage imageNamed:@"Default"];
//    [self.view addSubview:imageView];
    
    
}
- (IBAction)action:(UIButton *)sender
{
//    [_aView shakingAnimation];
    HDSharedViewController *sharedView = [ [HDSharedViewController alloc] init];
    sharedView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:sharedView animated:YES
                     completion:^{
                         
                     }];

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
