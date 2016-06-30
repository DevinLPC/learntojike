//
//  ViewController.m
//  MyButton
//
//  Created by mayee on 16/6/25.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *silverButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSilverdisButton];

}
- (IBAction)changeViewBackground:(UIButton *)sender {
    if (sender.tag == 1) {
        self.view.backgroundColor = [UIColor redColor];
    }else if (sender.tag == 2) {
        self.view.backgroundColor = [UIColor blueColor];
    }
}

-(void)createSilverdisButton{
    // Do any additional setup after loading the view, typically from a nib.
  
    silverDisButton = [[UIButton alloc] init];
    silverDisButton.frame = CGRectMake(20,260, 160, 80);
    silverDisButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:silverDisButton];

    [silverDisButton setImage:[UIImage imageNamed:@"buttonSilverOff"]
                                forState:UIControlStateNormal];
    [silverDisButton setImage:[UIImage imageNamed:@"buttonSilverOffDis"]
                                forState:UIControlStateDisabled];
    [silverDisButton setBackgroundImage:[UIImage imageNamed:@"buttonSilverybackground.jpg"]
                                            forState:UIControlStateNormal];
    
    [silverDisButton setTitle:@"金属按键" forState:UIControlStateNormal];
    [silverDisButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [silverDisButton setTitle:@"禁止按钮" forState:UIControlStateHighlighted];
    [silverDisButton setTitleColor:[UIColor blueColor] forState:UIControlStateDisabled];
    
    
    [silverDisButton setAdjustsImageWhenDisabled:YES];
}

    

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    silverDisButton.enabled = NO;
    [self.blueButton setTitle:@"选中" forState:UIControlStateSelected];
    self.blueButton.selected = YES;
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    silverDisButton.enabled = YES;
    self.blueButton.selected = NO;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
