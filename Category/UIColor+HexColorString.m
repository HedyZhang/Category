//
//  UIColor+HexColorString.m
//  Category
//
//  Created by 张海迪 on 14-7-1.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import "UIColor+HexColorString.h"
#import <objc/objc.h>
@implementation UIColor (HexColorString)

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    if ([hexString rangeOfString:@"#"].location == 0 && [hexString rangeOfString:@"#"].length != 0)
    {
        NSMutableString *tempStr = [NSMutableString stringWithString:hexString];
        hexString =  [tempStr stringByReplacingOccurrencesOfString:@"#" withString:@"0x"];
    }
    else if ([hexString rangeOfString:@"#"].length == 0 || [hexString rangeOfString:@"0x"].length == 0)
    {
        NSMutableString *tempStr = [NSMutableString stringWithString:hexString];
        [tempStr insertString:@"0x" atIndex:0];
        hexString = [NSString stringWithFormat:@"%@", tempStr];
    }
    unsigned int value;
    [[NSScanner scannerWithString:hexString] scanHexInt:&value];
    UIColor *color = [UIColor colorWithRed:((value >> 16) & 0xff) / 255.0 green:((value >> 8) & 0xff) / 255.0 blue:(value & 0xff) / 255.0 alpha:1.0];
    return color;
}

+ (NSString *)HexRGBFromColor:(UIColor *)color
{
  
    const CGFloat *colorComponents = CGColorGetComponents(color.CGColor);
    NSLog(@"=============%zu", CGColorGetNumberOfComponents(color.CGColor));
    NSString *r = [NSString stringWithFormat:@"%@", [UIColor  ToHex:colorComponents[0] * 255]];
    NSString *g = [NSString stringWithFormat:@"%@", [UIColor  ToHex:colorComponents[1] * 255]];
    NSString *b = [NSString stringWithFormat:@"%@", [UIColor  ToHex:colorComponents[2] * 255]];
    return [NSString stringWithFormat:@"#%@%@%@", r, g, b];
}


//十进制转十六进制
+ (NSString *)ToHex:(int)tmpid
{
    NSString *endtmp = @"";
    NSString *nLetterValue;
    NSString *nStrat;
    int ttmpig = tmpid % 16;
    int tmp = tmpid / 16;
    switch (ttmpig)
    {
        case 10:
            nLetterValue = @"A";break;
        case 11:
            nLetterValue = @"B";break;
        case 12:
            nLetterValue = @"C";break;
        case 13:
            nLetterValue = @"D";break;
        case 14:
            nLetterValue = @"E";break;
        case 15:
            nLetterValue = @"F";break;
        default:nLetterValue = [NSString stringWithFormat:@"%i",ttmpig];
            
    }
    switch (tmp)
    {
        case 10:
            nStrat = @"A";break;
        case 11:
            nStrat = @"B";break;
        case 12:
            nStrat = @"C";break;
        case 13:
            nStrat = @"D";break;
        case 14:
            nStrat = @"E";break;
        case 15:
            nStrat = @"F";break;
        default:nStrat = [NSString stringWithFormat:@"%i", tmp];
            
    }
    endtmp = [NSString stringWithFormat:@"%@%@", nStrat, nLetterValue];
    return endtmp;
}

@end
