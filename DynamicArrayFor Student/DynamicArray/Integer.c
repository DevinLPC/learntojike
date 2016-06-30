//
//  Integer.c
//  DynamicArray
//
//  Created by mayee on 16/6/2.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#include "Integer.h"
#include <stdlib.h>
#include "Object.h"
Integer* IntegerNew(int32_t value) {
    Integer * ins = malloc(sizeof(Integer));
    //ins->retainCount_;
    ObjectRetain((Object*)ins);
    ins->value_ = value;
    return  ins;
}

int32_t IntegerGet(Integer *ins) {
    return ins->value_;
}