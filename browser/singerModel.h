//
//  singerModel.h
//  browser
//
//  Created by mayee on 16/7/1.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singerModel : NSObject
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*songname;
@property(nonatomic,copy)NSString*pic;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)singerModelWithDict:(NSDictionary*)dict;


@end
