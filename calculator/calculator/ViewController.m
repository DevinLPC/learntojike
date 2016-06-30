//
//  ViewController.m
//  calculator
//
//  Created by mayee on 16/6/21.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTextField1;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField2;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *subButton;
@property (weak, nonatomic) IBOutlet UIButton *mulButton;
@property (weak, nonatomic) IBOutlet UIButton *divButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLable;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        /* //给加法按钮添加单击事件响应函数add1
     [self.add addTarget:self action:@selector(add1) forControlEvents:UIControlEventTouchUpInside];
     ////加法按钮////////添加到当前类///////添加响应函数///////响应事件的类型/
     //给减法按钮添加单击事件响应函数add1
     [self.sub addTarget:self action:@selector(sub1) forControlEvents:UIControlEventTouchUpInside];
     */
    _inputTextField1.keyboardType = UIKeyboardTypeDecimalPad;
    _inputTextField2.keyboardType = UIKeyboardTypeDecimalPad;

    
    [self.addButton addTarget:self action:@selector(calculateMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.subButton addTarget:self action:@selector(calculateMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.mulButton addTarget:self action:@selector(calculateMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.divButton addTarget:self action:@selector(calculateMethod:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)calculateMethod:(UIButton*)btn {
    //1、获取用户输入
    NSString *strInput1 = self.inputTextField1.text;
    NSString *strInput2 = self.inputTextField2.text;
    float fResult = 0;
    if(![strInput1 length] || ![strInput2 length]) {
        self.resultLable.text = [NSString stringWithUTF8String:"请输入数值"];
        return;

    }
    
    //2、计算结构
    if([btn.titleLabel.text isEqualToString:@"加"]) {
        fResult = [strInput1 floatValue] + [strInput2 floatValue];
    }
    else if([btn.titleLabel.text isEqualToString:@"减"]){
        fResult = [strInput1 floatValue] - [strInput2 floatValue];
    }
    else if([btn.titleLabel.text isEqualToString:@"乘"]){
        fResult = [strInput1 floatValue] * [strInput2 floatValue];
    }
    else if([btn.titleLabel.text isEqualToString:@"除"]){
        int intv = [strInput2 intValue];

        if (intv == 0) {
            self.resultLable.text = [NSString stringWithUTF8String:"除数不能为零"];
            return;
        }else{
            
            fResult = [strInput1 floatValue] /[strInput2 floatValue];
        }
    }
    //3、返回结构
    self.resultLable.text = [NSString stringWithFormat:@"%.02f",fResult];
}


@end
