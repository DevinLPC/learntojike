//
//  ViewController.m
//  singerLayout
//
//  Created by mayee on 16/7/6.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"
#import "singerModel.h"


#define Ymargin 40    //view距离控制器顶部的距离
#define viewWidth 80  //view的宽度
#define viewHeight 100//view的gaodu
#define column 3      //列数
#define viewYmargin 25 //view和viewY方向的间距

@interface ViewController ()

@property(nonatomic,strong) NSMutableArray *arrayAll;

@end

@implementation ViewController

//懒加载  延时加载
-(NSMutableArray*)arrayAll
{
    if (!_arrayAll) {
        _arrayAll = [NSMutableArray array];
        NSString*strPath = [[NSBundle mainBundle]pathForResource:@"picList.plist" ofType:nil];
        NSArray*array =[NSArray arrayWithContentsOfFile:strPath];
        for (NSDictionary *dict in array) {
            singerModel *mode = [singerModel singerModelWithDict:dict];
            [_arrayAll addObject:mode];
        }
    }
    return _arrayAll;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self arrayAll];
    
  
    int iXmargin = (self.view.frame.size.width - (viewWidth*column))/(column+1);

    for (int i =0; i < 9;i++) {
        if (i<self.arrayAll.count) {
            singerModel *mod = self.arrayAll[i];
            int iColumn = i%column;// 列
            int iRow = i/column;   //行
            int x = iXmargin + (viewWidth+iXmargin)*iColumn;
            int y = Ymargin + (viewHeight+viewYmargin)*iRow;
            UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(x, y, viewWidth, viewHeight)];
            [self.view addSubview:view1];
            [self addSubControl:view1 model:mod];
    
        }
    }
    
}
- (void)addSubControl:(UIView*)uiviewParent model:(singerModel*)model1{
    CGRect rectPar = uiviewParent.bounds;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, rectPar.size.width, 50)];
    imageView.image = [UIImage imageNamed:model1.pic];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [uiviewParent addSubview:imageView];
    
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 55, rectPar.size.width, 20)];
    //label.backgroundColor = [UIColor orangeColor];
    label.text = model1.songname;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:13];
    [uiviewParent addSubview:label];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 80, rectPar.size.width,20)];
    //btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"下载" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"normal.jpg"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"highlighted.jpg"] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [btn addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
    
    [uiviewParent addSubview:btn];
    

    
}
- (void)download {
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 400, 100, 30)];
    tipLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:tipLabel];
    tipLabel.alpha = 1.0;
    tipLabel.text =@"下载完成";
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
    //UIView 动画函数，动画持续时间为2秒
    [UIView animateWithDuration:2.0 animations:^{
        tipLabel.alpha = 0;    //具体执行的动画
    }completion:^(BOOL finished) {
        [tipLabel removeFromSuperview];//动画完成后执行的操作
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
