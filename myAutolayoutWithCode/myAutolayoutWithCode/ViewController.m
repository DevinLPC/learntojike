//
//  ViewController.m
//  myAutolayoutWithCode
//
//  Created by mayee on 16/7/5.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createView];              //1、添加view到夫窗口上
    [self setViewAutoresizing];     //2、禁用autoresizeing功能
    [self setViewlAyout];
    //3、创建一个约束
    /*
    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:redView
        attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view
        attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    
    //4、添加一个约束
    [self.view addConstraint:constraintLeft];
    */

    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//1、添加view到夫窗口上
- (void)createView{

    UIView *red = [[UIView alloc]init];
    red.backgroundColor =[UIColor redColor];
    self.redView =red;
    [self.view addSubview:self.redView];
   
    
    UIView *blue = [[UIView alloc]init];
    blue.backgroundColor =[UIColor blueColor];
    self.blueView = blue;
    [self.redView addSubview:self.blueView];
  
    
    UIView *green = [[UIView alloc]init];
    green.backgroundColor =[UIColor greenColor];
    self.greenView = green;
    [self.view addSubview:self.greenView];


}

//2、禁用autoresizeing功能
- (void)setViewAutoresizing{
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO;
    self.greenView.translatesAutoresizingMaskIntoConstraints = NO;
}

//3、创建和添加约束
- (void)setViewlAyout{
    //创建和添加redView和greenView的约束
    NSArray *redRoGreenArrH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView100]-20-[greenView200(==redView100)]-20-|" options:NSLayoutFormatAlignAllBottom|NSLayoutFormatAlignAllTop metrics:nil views:@{@"redView100":self.redView,@"greenView200":self.greenView}];
    [self.view addConstraints:redRoGreenArrH];
    NSArray *redRoGreenArrV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[redview200(==200)]" options:0 metrics:nil views:@{@"redview200":self.redView}];
    [self.view addConstraints:redRoGreenArrV];

    //创建和添加blue的约束

    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:self.blueView
    attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.redView
    attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [self.redView addConstraint:constraintLeft];

    
    NSLayoutConstraint *constraintWidth = [NSLayoutConstraint constraintWithItem:self.blueView
    attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.redView
    attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.redView addConstraint:constraintWidth];
    
    NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:self.blueView
    attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.redView
    attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0];
    [self.redView addConstraint:constraintHeight];

    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:self.blueView
    attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.redView
    attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.redView addConstraint:constraintTop];
    

}


@end
