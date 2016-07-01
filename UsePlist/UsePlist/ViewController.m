//
//  ViewController.m
//  UsePlist
//
//  Created by mayee on 16/6/30.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"
#import "studentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1、获取路径
    NSString *strPath = [[NSBundle mainBundle]pathForResource:@"student.plist" ofType:nil];
    //2、读取文件
    NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];
//  NSDictionary * did = [NSDictionary dictionaryWithContentsOfFile:strPath];
    //3、解析数据
    
    for (NSDictionary *dict in arr) {
        /*
        NSString *name1 =[dict objectForKey:@"name"];
        NSLog(name1,nil);
        NSString *sex1 = dict[@"sex"];
        NSLog(sex1,nil);
        NSNumber*age1 = dict[@"age"];
        NSLog(@"%@",age1);*/
        studentModel *model = [studentModel studentModelWithDIct:dict];
        
        NSLog(model.name,nil);
        NSLog(model.sex,nil);
        NSLog(@"%d",model.age);
        
    }
}


@end
