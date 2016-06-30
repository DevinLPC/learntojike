//
//  Students.h
//  DynamicArray
//
//  Created by mayee on 16/6/6.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#ifndef Students_h
#define Students_h

#include <stdio.h>
#include <string.h>
typedef struct Student_ {
    int retainCount_;
    char * name_;
    int32_t age_;
}Student;

Student* StudentNew(char* name,int32_t age);
int32_t StudentGetAge(Student *stu);
char* StudentGetName(Student *stu);

#endif /* Students_h */
