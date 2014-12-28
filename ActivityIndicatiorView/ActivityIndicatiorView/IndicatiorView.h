//
//  IndicatiorView.h
//  ActivityIndicatiorView
//
//  Created by 张海迪 on 14/12/28.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndicatiorView : UIView
@property (nonatomic) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic) BOOL isAnimating;

- (void)startAnimation;
- (void)stopAnimation;
@end
