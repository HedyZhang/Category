//
//  NSArray+ArraySort.m
//  Test
//
//  Created by 张海迪 on 14-5-15.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import "NSArray+ArraySort.h"
void quicksort(int a[],int left,int right)
{
    int i,j,temp;
    i=left;
    j=right;
    temp=a[left];
    if(left>right)
        return;
    while(i!=j)
    {
        while(a[j]>=temp&&j>i)
            j--;
        if(j>i)
            a[i++]=a[j];
        while(a[i]<=temp&&j>i)
            i++;
        if(j>i)
            a[j--]=a[i];
        
    }
    a[i]=temp;
    quicksort(a,left,i-1);
    quicksort(a,i+1,right);
}
@implementation NSArray (ArraySort)
+ (NSArray *)sortBlock:(NSArray *)ary
{

   NSArray * array = [ary sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return NSOrderedAscending;
        }
        return NSOrderedSame;
    }];
    return array;
}

+ (NSMutableArray *)quickSort:(NSMutableArray *)ary
{

    [[self class] quickSort:ary startIndex:0 endIndex:ary.count - 1];
    return ary;
}

+ (void)quickSort:(NSMutableArray *)listArray
       startIndex:(NSInteger )startIndex
         endIndex:(NSInteger)endIndex
{
    if (startIndex >= endIndex)
    {
        return;
    }
    
    //临时变量 中间值
    NSNumber *temp = [listArray objectAtIndex:startIndex];
    NSInteger tempIndex = startIndex;
    
    for (int i =  startIndex + 1; i <= endIndex; ++i)
    {
        NSNumber *t = [listArray objectAtIndex:i];
        //遇到比中间值大的值 就会产生下标差
        if ([temp intValue] > [t intValue])
        {
            tempIndex++;
            [listArray exchangeObjectAtIndex:tempIndex withObjectAtIndex:i];
        }
    }
    
    [listArray exchangeObjectAtIndex:tempIndex withObjectAtIndex:startIndex];
    [self quickSort:listArray startIndex:startIndex endIndex:tempIndex - 1];
    [self quickSort:listArray startIndex:tempIndex + 1 endIndex:endIndex];
}

+ (void)quickSortWithArray:(NSMutableArray *)listArray startIndex:(NSInteger )left endIndex:(NSInteger )right
{
    if (right > left) {
        NSInteger i = left;
        NSInteger j = right + 1;
        while (true) {
            while (i + 1 <= [listArray count] && [listArray objectAtIndex:++i] > [listArray objectAtIndex:left]);
            while (j - 1 >= -1 && [listArray objectAtIndex:--j] < [listArray objectAtIndex:left]);
            if (i >= j) {
                break;
            }
            [listArray exchangeObjectAtIndex:i withObjectAtIndex:j];

        }
        [listArray exchangeObjectAtIndex:left withObjectAtIndex:j];
        [self quickSortWithArray:listArray startIndex:left endIndex:j - 1];
        [self quickSortWithArray:listArray startIndex:j + 1 endIndex:right];

    }
    
}

@end
