//
//  ui_ActivityIndicatorView.m
//  vidon_me_pad
//
//  Created by haidi on 14-7-1.
//
//

#import "ui_ActivityIndicatorView.h"
#import "PlayerDefines.h"
@interface ui_ActivityIndicatorView ()
{
    UIImageView * _indicator;
    NSMutableArray * _imageArray;
}

@end

@implementation ui_ActivityIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static ui_ActivityIndicatorView * __singleton__;
    dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } );
    return __singleton__;
}

+ (UIWindow *)sharedWindow
{
    static dispatch_once_t once;
    static UIWindow * __singleton__;
    dispatch_once( &once, ^{
        __singleton__ = [[[UIApplication sharedApplication] delegate] window];
    } );
    return __singleton__;
}

- (void)creatIndicator
{    
    NSLog(@"creatMyIndicator");
    UIWindow *window = [ui_ActivityIndicatorView sharedWindow];
    _imageArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 1; i <= 12; i++) {
        NSString * str = [NSString stringWithFormat:@"%02d", i];
        UIImage * image = ImageWithName(str);
        if( image ){
            [_imageArray addObject:image];
        }
    }
    _indicator = [[UIImageView alloc] initWithImage:ImageWithName(@"01")];
    _indicator.frame = kRect(0, 0, 40, 40);
    _indicator.center = CGPointMake(kScreenHeight / 2.f, kScreenWidth / 2.f);
    _indicator.animationImages = _imageArray;
    _indicator.animationDuration = 0.7;
    [window addSubview:_indicator];
    [_indicator release];
    
}
- (void)show
{
    if (_indicator == nil)
    {
        [self creatIndicator];
        [_indicator startAnimating];
    }

}
- (void)stop
{
    if (_indicator != nil) {
        [_indicator stopAnimating];
        [_indicator removeFromSuperview];
        _indicator = nil;
    }
}

+ (void)show
{
    [[ui_ActivityIndicatorView sharedInstance] show];
}

+ (void)stop
{
      [[ui_ActivityIndicatorView sharedInstance] stop];

}
@end
