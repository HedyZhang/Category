//
//  UIColor+HexColorString.h
//  Category
//
//  Created by 张海迪 on 14-7-1.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColorString)
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (NSString *)HexRGBFromColor:(UIColor *)color;

@end
