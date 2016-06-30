//
//  Array.c
//  DynamicArray
//
//  Created by mayee on 16/6/2.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#include "Array.h"
#include <stdlib.h>
#include <string.h>
#include <assert.h>

static AnyPointer * allcoMemoryByCapacity(Array *arr) {
    return malloc(sizeof(AnyPointer) * arr->capacity_);
}


Array * ArrayCreate() {
    Array * arr = malloc(sizeof(Array));
    arr->length_ = 0;
    arr->capacity_ = 32;
    arr->values_ = allcoMemoryByCapacity(arr);
    return arr;
}
int ArrayGetLength(Array *arr) {
    return arr->length_;
}

void ArrayAdd(Array *arr,AnyPointer value) {
    if(arr->length_ >= arr->capacity_) {
//        int *newMem = malloc(sizeof(int)*arr->capacity_*2);
        arr->capacity_ *= 2;
        AnyPointer *oldValues = arr->values_;
        arr->values_ = allcoMemoryByCapacity(arr);
        memcpy(arr->values_, oldValues, sizeof(void*) * arr->length_);
        free(oldValues); 
    }
        
    arr->values_[arr->length_] = value;
    arr->length_++;
    
    OBJECT_RETAIN(value);

}
void ArrayAddAtIndex(Array *arr,int index,AnyPointer value) {
    assert(index >= 0 && index < arr->length_);//断言
    if(arr->length_ >= arr->capacity_) {
        arr->capacity_ *= 2;
        AnyPointer *oldValues = arr->values_;
        arr->values_ = allcoMemoryByCapacity(arr);
        memcpy(arr->values_, oldValues, sizeof(void*) * arr->length_);
        free(oldValues);
    }
    arr->length_++;
    for (int i = arr->length_; i > index-1; i--) {
        arr->values_[i] = arr->values_[i-1];
    }
    arr->values_[index-1] = value;
}

void ArrayRemoveAtIndex(Array *arr,int index) {
    assert(index >= 0 && index < arr->length_);//断言
    OBJECT_RELEASE(ArrayGet(arr, index));
    
    arr->length_ --;
    for (int i = index; i < arr->length_; i++) {
        arr->values_[i] = arr->values_[i+1];
    }
}

void ArrayUpdateAtIndex(Array *arr,int index,AnyPointer newValue) {
    assert(index >= 0 && index < arr->length_);//断言
    arr->values_[index-1] = newValue;
}

AnyPointer ArrayGet(Array *arr,int index) {
    assert(index >= 0 && index < arr->length_);//断言
    return arr->values_[index];
}

void ArrayDestory(Array * arr) {
    for (int i = 0; i <ArrayGetLength(arr); i ++) {
            //free(arr->values_[i]);
        OBJECT_RELEASE(arr->values_[i]);
    }

    if (arr->length_ == 0) {
       free(arr);
    }
    
    printf("Array was destroyed\n");
}