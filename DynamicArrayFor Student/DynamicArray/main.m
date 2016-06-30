//
//  main.m
//  DynamicArray
//
//  Created by mayee on 16/6/2.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Array.h"
#include "Object.h"
#include "Students.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Array * arr = ArrayCreate();
        Student * stu1 = StudentNew("张三", 20);
        ArrayAdd(arr, (AnyPointer)stu1);
        OBJECT_RELEASE(stu1);
        
        Student * stu2 = StudentNew("李四", 18);
        ArrayAdd(arr, (AnyPointer)stu2);
        OBJECT_RELEASE(stu2);
        
        Student * stu3 = StudentNew("小明", 22);
        ArrayAdd(arr, (AnyPointer)stu3);
        OBJECT_RELEASE(stu3);
        
        Student * stu4 = StudentNew("小红", 20);
        ArrayAdd(arr, (AnyPointer)stu4);
         OBJECT_RELEASE(stu4);
        
        Student * stu5 = StudentNew("大明", 23);
        ArrayAdd(arr, (AnyPointer)stu5);
         OBJECT_RELEASE(stu5);
        
        for (int i = 0; i <ArrayGetLength(arr); i ++) {
            printf("位置:%d,\t姓名:%s,\t年龄:%d\n",i+1,
                   StudentGetName((Student *)ArrayGet(arr,i)),
                   StudentGetAge((Student *)ArrayGet(arr,i)));

        }
        printf("删掉小明在打印一遍，(删除元素)\n");
        ArrayRemoveAtIndex(arr, 2);
        for (int i = 0; i <ArrayGetLength(arr); i ++) {
            printf("位置:%d,\t姓名:%s,\t年龄:%d\n",i+1,
                   StudentGetName((Student *)ArrayGet(arr,i)),
                   StudentGetAge((Student *)ArrayGet(arr,i)));
            
        }
        printf("欢迎新同学老王,(插入元素)\n");
        Student * stu = StudentNew("老王", 20);
        ArrayAddAtIndex(arr, 3,(AnyPointer)stu);
        OBJECT_RELEASE(stu);
        
        for (int i = 0; i <ArrayGetLength(arr); i ++) {
            printf("位置:%d,\t姓名:%s,\t年龄:%d\n",i+1,
                   StudentGetName((Student *)ArrayGet(arr,i)),
                   StudentGetAge((Student *)ArrayGet(arr,i)));
            
        }
        printf("修改第三上的值\n");
        stu = StudentNew("王佳", 22);
        ArrayUpdateAtIndex(arr, 3, stu);
        
        for (int i = 0; i <ArrayGetLength(arr); i ++) {
            printf("位置:%d,\t姓名:%s,\t年龄:%d\n",i+1,
                   StudentGetName((Student *)ArrayGet(arr,i)),
                   StudentGetAge((Student *)ArrayGet(arr,i)));
            
        }

        
        printf("第二个人是谁？\n");
        printf("他是%s，今年%d\n",
               StudentGetName((Student *)ArrayGet(arr,2-1)),
               StudentGetAge((Student *)ArrayGet(arr,2-1)));
        
        ArrayDestory(arr);

    }
   
    return 0;
}
