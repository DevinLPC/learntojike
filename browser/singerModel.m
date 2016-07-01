//
//  singerModel.m
//  browser
//
//  Created by mayee on 16/7/1.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "singerModel.h"

@implementation singerModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    self = [self init];
    if (self) {
        //使用KVC
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;

}

+(instancetype)singerModelWithDict:(NSDictionary*)dict
{
    return [[singerModel alloc] initWithDict:dict];
}

@end
