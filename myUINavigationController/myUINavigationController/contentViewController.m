//
//  contentViewController.m
//  myUINavigationController
//
//  Created by mayee on 16/7/8.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "contentViewController.h"

@interface contentViewController ()
//@property (weak, nonatomic) IBOutlet UITextView *contentView;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;

@end

@implementation contentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Detail";
    
    self.contentTextField.text = self.content;

}


+ (void)setContent:(NSString *)str {
    self.content = str;
}

@end
