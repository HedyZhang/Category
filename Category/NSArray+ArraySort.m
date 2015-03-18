//
//  NSArray+ArraySort.m
//  Test
//
//  Created by 张海迪 on 14-5-15.
//  Copyright (c) 2014年 haidi. All rights reserved.
//

#import "NSArray+ArraySort.h"

void exchange(int *a, int *b)
{
    int temp;
    temp = *a;
    *a = *b;
    *b = temp;
}
@implementation NSArray (ArraySort)
//--------------------------------------------快速排序---------------------------------------------
 void quickSort(int a[], int left, int right)
{
    if(left>right)
        return;
    int i,j,temp;
    i=left;
    j=right;
    temp=a[left];
    while(i!=j)
    {
        while(a[j]>=temp&&j>i)
            j--;
        if(j>i)
            a[i++]=a[j];
        while(a[i]<temp&&j>i)
            i++;
        if(j>i)
            a[j--]=a[i];
    }
    a[i]=temp;
    quickSort(a,left,i-1);
    quickSort(a,i+1,right);
}

+ (void)quickSortWithArray:(NSMutableArray *)sortArray startIndex:(NSInteger)left endIndex:(NSInteger)right
{
    if (left < right)
    {
        NSInteger i = 0, j = 0;
        id temp;
        i = left;
        j = right;
        temp = sortArray[left];
        while (i != j)
        {
            while ((sortArray[j] >= temp) && (j > i))
            {
                j--;
            }
            if (j > i)
            {
                sortArray[i++] = sortArray[j];
            }
            while ((sortArray[i] < temp) && (j > i))
            {
                i++;
            }
            if (j > i)
            {
                sortArray[j--] = sortArray[i];
            }
        }
        sortArray[i] = temp;
        [self quickSortWithArray:sortArray startIndex:left endIndex:i - 1];
        [self quickSortWithArray:sortArray startIndex:i + 1 endIndex:right];
    }
}
//-----------------------------------------------冒泡排序-----------------------------------------
void bubbleSort(int a[], int n)
{
    int temp;
    for (int i = 0; i < n - 1 ; i++)
    {
        for (int j = 0; j < n - i - 1; j++)
        {
            if (*(a + j ) > *(a + j + 1))
            {
                temp = *(a + j);
                *(a + j ) = *(a + j + 1);
                *(a + j + 1) = temp;
            }
        }
    }
}

//-----------------------------------------------插入排序-----------------------------------------
 void insertSort(int a[], int n)
{
    int i,j;
    int temp;
    for( i = 1; i< n; i++)
    {
        temp= *(a+i);
        for(j=i; j>0 && *(a+j-1)>temp; j--)
        {
            *(a+j) = *(a+j-1);
        }
        *(a+j) = temp;
    }
}

//-----------------------------------------------希尔排序-----------------------------------------
void shellInsertSort(int a[], int n, int dk)
{
    for(int i= dk; i<n; ++i){
        if(a[i] < a[i-dk]){          //若第i个元素大于i-1元素，直接插入。小于的话，移动有序表后插入
            int j = i-dk;
            int x = a[i];           //复制为哨兵，即存储待排序元素
            a[i] = a[i-dk];         //首先后移一个元素
            while(x < a[j]){     //查找在有序表的插入位置
                a[j+dk] = a[j];
                j -= dk;             //元素后移
            }
            a[j+dk] = x;            //插入到正确位置
        }
        for (int i = 0; i < n; i++)
        {
            printf("%d", a[i]);
        }
    }
    
}
//-----------------------------------------------选择排序-----------------------------------------
/**
 * 数组的最小值
 *
 * @return int 数组的键值
 */
int selectMinKey(int a[], int n, int i)
{
    int k = i;
    for(int j=i+1 ;j< n; ++j)
    {
        if(a[k] > a[j]) k = j;
    }
    return k;
}

/**
 * 选择排序
 *
 */
void selectSort(int a[], int n){
    int key, tmp;
    for(int i = 0; i< n; ++i) {
        key = selectMinKey(a, n,i);           //选择最小的元素
        if(key != i){
            tmp = a[i];  a[i] = a[key]; a[key] = tmp; //最小元素与第i位置元素互换
        }
        for (int i = 0; i < n; i++)
        {
            printf("%d", a[i]);
        }

    }
}
//-----------------------------------------------归并排序-----------------------------------------
void Merge(int sourceArr[],int tempArr[],int startIndex,int midIndex,int endIndex)
{
    int i = startIndex,j=midIndex+1,k = startIndex;
    while(i!=midIndex+1 && j!=endIndex+1)
    {
        if(sourceArr[i]>sourceArr[j])
            tempArr[k++] = sourceArr[i++];
        else
            tempArr[k++] = sourceArr[j++];
    }
    while(i!=midIndex+1)
        tempArr[k++] = sourceArr[i++];
    while(j!=endIndex+1)
        tempArr[k++] = sourceArr[j++];
    for(i=startIndex;i<=endIndex;i++)
        sourceArr[i] = tempArr[i];
}

//内部使用递归
void MergeSort(int sourceArr[],int tempArr[],int startIndex,int endIndex)
{
    int midIndex;
    if(startIndex<endIndex)
    {
        midIndex=(startIndex+endIndex)/2;
        MergeSort(sourceArr,tempArr,startIndex,midIndex);
        MergeSort(sourceArr,tempArr,midIndex+1,endIndex);
        Merge(sourceArr,tempArr,startIndex,midIndex,endIndex);
    }
}@end
