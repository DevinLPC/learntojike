//
//  ViewController.m
//  MyUITest
//
//  Created by mayee on 16/6/25.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UILabel *sliderShow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.mySlider addTarget:self action:@selector(sliderAlphaOrZoom) forControlEvents:UIControlEventValueChanged];
  
    [self.mySwitch addTarget:self action:@selector(sliderSwitch) forControlEvents:UIControlEventTouchUpInside];
    self.sliderShow.text =[NSString stringWithFormat:@"%d%%",(int)self.mySlider.value ];

}

-(void)sliderAlphaOrZoom {
    
    if(self.mySwitch.isOn){
        self.myImage.alpha = self.mySlider.value/100;
    }else{
        CGRect rect = self.mySlider.bounds;
        rect.size.width =(int)self.mySlider.value *3;
        rect.size.height =(int)self.mySlider.value *3;
        self.myImage.bounds = rect;
    }
    self.sliderShow.text =[NSString stringWithFormat:@"%d%%",(int)self.mySlider.value ];
}

-(void)sliderSwitch {
    //如果想在开关量根据开关值重新指定mySlider的调用函数该怎么办呢？
/*    if(self.mySwitch.isOn){
        self.mySlider.enabled = YES;
    }else{
        self.mySlider.enabled = NO;
    }*/
}
@end
