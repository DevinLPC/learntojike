//
//  ViewController.m
//  UseUIView
//
//  Created by mayee on 16/6/22.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *cyanView;
@property (weak, nonatomic) IBOutlet UIView *whiteView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"readview frame =%@",NSStringFromCGRect(self.redView.frame));
    NSLog(@"readview bounds =%@",NSStringFromCGRect(self.redView.bounds));
    NSLog(@"readview center =%@",NSStringFromCGPoint(self.redView.center));
  
    NSLog(@"blueView frame =%@",NSStringFromCGRect(self.blueView.frame));
    NSLog(@"blueView bounds =%@",NSStringFromCGRect(self.blueView.bounds));
    NSLog(@"blueView center =%@",NSStringFromCGPoint(self.blueView.center));
    
    NSLog(@"greenView frame =%@",NSStringFromCGRect(self.greenView.frame));
    NSLog(@"greenView bounds =%@",NSStringFromCGRect(self.greenView.bounds));
    NSLog(@"greenView center =%@",NSStringFromCGPoint(self.greenView.center));
    
    
    NSLog(@"cyanView frame =%@",NSStringFromCGRect(self.cyanView.frame));
    NSLog(@"cyanView bounds =%@",NSStringFromCGRect(self.cyanView.bounds));
    NSLog(@"cyanView center =%@",NSStringFromCGPoint(self.cyanView.center));
    
    NSLog(@"whiteView frame =%@",NSStringFromCGRect(self.whiteView.frame));
    NSLog(@"whiteView bounds =%@",NSStringFromCGRect(self.whiteView.bounds));
    NSLog(@"whiteView center =%@",NSStringFromCGPoint(self.whiteView.center));
    
    

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
