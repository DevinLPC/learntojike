//
//  ViewController.m
//  MyKVC
//
//  Created by mayee on 16/7/1.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"
#import "studentModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    studentModel *student = [[studentModel alloc]init];
    studentModel *student2 = [[studentModel alloc]init];
    
    //直接复制访问属性
    student.name = @"张山";
    student.sex = @"男";
    student.age = 22;
    NSLog(@"%@ %@ %d",student.name,student.sex,student.age);
    
    //使用KVC设置类的属性
    [student setValue:@"张三" forKey:@"name"];
    [student setValue:@"男" forKey:@"sex"];
    [student setValue:@"25" forKey:@"age"];
    
    //使用KVC获取类的属性
    NSLog(@"%@ %@ %@",[student valueForKey:@"name"],[student valueForKey:@"sex"],[student valueForKey:@"age"]);

    [student setValue:student2 forKey:@"studentFriend"];
    [student setValue:@"李四" forKeyPath:@"studentFriend.name"];
    NSLog(@"%@",[student valueForKeyPath:@"studentFriend.name"]);
    
    NSString *strPath =[[NSBundle mainBundle]pathForResource:@"student.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];

    for (NSDictionary *dict in arr) {
        studentModel *model = [studentModel studentModelWithDIct:dict];
        
        NSDictionary *dictTemp = [model dictionaryWithValuesForKeys:@[@"name",@"sex",@"age"]];
        
        int a = 5;
    }
    


}



@end
