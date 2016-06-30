//
//  Students.c
//  DynamicArray
//
//  Created by mayee on 16/6/6.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#include "Students.h"
#include <stdlib.h>
#include "Object.h"
Student* StudentNew(char* name,int32_t age) {
    Student * stu = malloc(sizeof(Student));
    OBJECT_RETAIN(stu);
    stu->name_ = name;
    stu->age_ = age;
    return stu;
}

int32_t StudentGetAge(Student *stu) {
    return stu->age_;

}
char* StudentGetName(Student *stu) {
    return stu->name_;
}