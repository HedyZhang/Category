//
//  GridView.m
//  GridView
//
//  Created by yanshu on 15/4/29.
//  Copyright (c) 2015年 yanshu. All rights reserved.
//

#import "GridView.h"

@interface GridView ()
{
    
    int _rowCount;
    int _columnCount;
}
@end

@implementation GridView

- (instancetype)initWithFrame:(CGRect)frame rowCount:(int)rowCount columnCount:(int)columnCount
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        _rowCount = rowCount;
        _columnCount = columnCount;
    }
    return self;
}

- (void)setDataSources:(NSArray *)dataSources
{
    if (_dataSources != dataSources)
    {
        _dataSources = dataSources;
        [self setNeedsDisplay];
    }
}


- (void)drawRect:(CGRect)rect
{
    if (_dataSources)
    {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        CGFloat columnWidth = self.frame.size.width / _columnCount;
        CGFloat rowHeight = self.frame.size.height / _rowCount;
        if (!_lineWidth)
        {
            self.lineWidth = 2.f;
        }
        if (!_lineColor)
        {
            self.lineColor = [UIColor grayColor];
        }
        bezierPath.lineWidth = self.lineWidth;
        shapeLayer.strokeColor = self.lineColor.CGColor;
        for (int i = 0; i < _rowCount + 1; i++)
        {
            //braw row  lines
            [bezierPath moveToPoint:CGPointMake(0, rowHeight * i)];
            [bezierPath addLineToPoint:CGPointMake(self.frame.size.width, rowHeight *i)];
        }
        for (int i = 0; i < _columnCount + 1; i++)
        {
            //braw column line
            [bezierPath moveToPoint:CGPointMake(columnWidth * i, 0.0)];
            [bezierPath addLineToPoint:CGPointMake(columnWidth * i, self.frame.size.height)];
        }
        
        shapeLayer.path = bezierPath.CGPath;
        [self.layer addSublayer:shapeLayer];
    }
}
@end
