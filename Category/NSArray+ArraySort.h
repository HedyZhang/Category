//
//  NSArray+ArraySort.h
//  Test
//
//  Created by 张海迪 on 14-5-15.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ArraySort)

+ (NSArray *)sortBlock:(NSArray *)ary;

//快速排序
+ (NSMutableArray *)quickSort:(NSMutableArray *)ary;

+ (void)quickSortWithArray:(NSMutableArray *)listArray startIndex:(NSInteger )left endIndex:(NSInteger )right;
@end
