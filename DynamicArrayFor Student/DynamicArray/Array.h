//
//  Array.h
//  DynamicArray
//
//  Created by mayee on 16/6/2.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#ifndef Array_h
#define Array_h

#include <stdio.h>
#include "Object.h"

//typedef Object* AnyPointer;
typedef void* AnyPointer;
typedef struct Array {
    int length_;
    int capacity_;
//    int *values_;
    void **values_;//任意类型的指针 void *
//    AnyPointer *values_;
} Array;

Array * ArrayCreate();
int ArrayGetLength(Array *arr);
void ArrayAdd(Array *arr,AnyPointer);
void ArrayAddAtIndex(Array *arr,int index ,AnyPointer value);
void ArrayRemoveAtIndex(Array *arr,int index);
void ArrayUpdateAtIndex(Array *arr,int index,AnyPointer newValue);
AnyPointer ArrayGet(Array *arr,int index);
void ArrayDestory(Array * arr);

#endif /* Array_h */
