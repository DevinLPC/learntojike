//
//  singerView.m
//  singerLayout
//
//  Created by mayee on 16/7/7.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "singerView.h"

@implementation singerView
- (IBAction)downLoad:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 400, 100, 30)];
    tipLabel.backgroundColor = [UIColor grayColor];
    [self.superview addSubview:tipLabel];
    tipLabel.alpha = 1.0;
    tipLabel.text =@"下载完成";
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
    //UIView 动画函数，动画持续时间为2秒
    [UIView animateWithDuration:2.0 animations:^{
        tipLabel.alpha = 0;    //具体执行的动画
    }completion:^(BOOL finished) {
        [tipLabel removeFromSuperview];//动画完成后执行的操作
        btn.enabled = NO;
    }];
}

+ (instancetype)share{
    //读取xib中的视图
    NSArray *arr = [[NSBundle mainBundle]loadNibNamed:@"singer" owner:nil options:nil];
    //获取数组第一个元素
    singerView *viewFromXib = [arr firstObject];
    
    return viewFromXib;
}

- (void) setModel:(singerModel *)model
{
    if (_model != model) {
        _model = model;
        self.singerViewImage.image = [UIImage imageNamed:_model.pic];
        self.singerViewLabel.text = _model.songname;
    }
}


@end
