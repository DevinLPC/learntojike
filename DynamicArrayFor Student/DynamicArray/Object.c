//
//  Object.c
//  DynamicArray
//
//  Created by mayee on 16/6/2.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#include "Object.h"
#include <stdlib.h>
void ObjectRetain(Object *obj) {
    obj->retainCount_++;
}

void ObjectRelease(Object *obj) {
    obj->retainCount_--;
    if (obj->retainCount_ <= 0) {
        free(obj);
        printf("The Object is release\n");
    }
}
int ObjectRetainCount(Object *obj) {
    return obj->retainCount_;
}