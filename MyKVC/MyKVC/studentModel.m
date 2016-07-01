//
//  studentModel.m
//  UsePlist
//
//  Created by mayee on 16/6/30.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "studentModel.h"

@implementation studentModel

-(instancetype)initWithDict:(NSDictionary*)dict
{
    //父类初始化
    self = [super init];
    //子类初始化
    if (self) {
/*        self.name = dict[@"name"];
        self.sex = dict[@"sex"];
        self.age = [dict[@"age"] integerValue];*/
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)studentModelWithDIct:(NSDictionary*)dict
{
    
    return [[studentModel alloc]initWithDict:dict];
}
@end
