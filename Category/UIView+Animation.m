//
//  UIView+Annimation.m
//  Category
//
//  Created by 张海迪 on 14/12/12.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)
- (void)shakingAnimation
{
    CAKeyframeAnimation * keyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframe.duration = 0.1;
    keyframe.values = @[
                        [NSValue valueWithCGPoint:CGPointMake(self.center.x - 10, self.center.y)],
                        [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)],
                        [NSValue valueWithCGPoint:CGPointMake(self.center.x + 10, self.center.y)],
                        [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y)]];

    [self.layer addAnimation:keyframe forKey:nil];
}
@end
