//
//  NSArray+ArraySort.h
//  Test
//
//  Created by 张海迪 on 14-5-15.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ArraySort)
 void quickSort(int a[],int left,int right);
+ (void)quickSortWithArray:(NSMutableArray *)sortArray startIndex:(NSInteger)left endIndex:(NSInteger)right;
void insertSort(int a[], int n);
void bubbleSort(int a[], int n);

@end
