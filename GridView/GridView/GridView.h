//
//  GridView.h
//  GridView
//
//  Created by yanshu on 15/4/29.
//  Copyright (c) 2015年 yanshu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GridView : UIView

- (instancetype)initWithFrame:(CGRect)frame rowCount:(int)rowCount columnCount:(int)columnCount;


@property (nonatomic, strong) NSArray *dataSources;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineColor;

@end
