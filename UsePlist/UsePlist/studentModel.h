//
//  studentModel.h
//  UsePlist
//
//  Created by mayee on 16/6/30.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface studentModel : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sex;
@property(nonatomic,assign)int age;

-(instancetype)initWithDict:(NSDictionary*)dict;

+(instancetype)studentModelWithDIct:(NSDictionary*)dict;

@end
