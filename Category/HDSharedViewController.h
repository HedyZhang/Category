//
//  HDSharedViewController.h
//  Category
//
//  Created by 张海迪 on 15/3/6.
//  Copyright (c) 2015年 haidi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ButtonActionItem;
typedef void(^ButtonActionItemHandler)(ButtonActionItem *buttonView);

@interface ButtonActionItem : UIView

@property (nonatomic ,strong) UIButton *imageButton;
@property (nonatomic, strong) UILabel *textLabel;

- (id)initWithText:(NSString *)text image:(UIImage *)image handler:(ButtonActionItemHandler)handler;
@end


@interface HDSharedViewController : UIViewController


@end
