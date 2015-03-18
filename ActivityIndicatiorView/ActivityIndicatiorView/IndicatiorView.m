//
//  IndicatiorView.m
//  ActivityIndicatiorView
//
//  Created by 张海迪 on 14/12/28.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import "IndicatiorView.h"

@interface IndicatiorView ()
@end

@implementation IndicatiorView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
   
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)startAnimation
{
    if (self.isAnimating)
    {
        [self stopAnimation];
        [self.layer removeAllAnimations];
    }
    _isAnimating = YES;
    [self startRotateAnimation];

}
- (void)stopAnimation
{
    _isAnimating = NO;
    [self stopRotateAnimation];
}
- (void)startRotateAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(2*M_PI);
    animation.duration = 1.f;
    animation.repeatCount = HUGE_VAL;
    [self.layer addAnimation:animation forKey:@"keyFrameAnimation"];
}
- (void)stopRotateAnimation
{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self.layer removeAllAnimations];
        [self removeFromSuperview];
    }];
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *lineColor = [UIColor redColor];
    CGFloat lineWidth = 1;
    if (_lineWidth)
    {
        lineWidth =  _lineWidth;
    }
    if (_lineColor) {
        lineColor = _lineColor;
    }
    CGContextSetLineWidth(context, lineWidth);
    CGContextAddArc(context, CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds),  CGRectGetWidth(self.bounds) / 2.f - lineWidth, 0, 2 * M_PI - 0.3, NO);
    CGContextSetStrokeColorWithColor(context, lineColor.CGColor);
    CGContextStrokePath(context);
}

@end
