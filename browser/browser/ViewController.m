//
//  ViewController.m
//  browser
//
//  Created by mayee on 16/7/1.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import "ViewController.h"
#import "singerModel.h"
@interface ViewController ()

@property(nonatomic,strong) NSMutableArray *arrayAll;

@property(nonatomic,strong)UILabel *tilleLable;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UIButton *nextButton;
@property(nonatomic,assign)int iIndex;

@end

@implementation ViewController

#pragma mark 创建标题lable懒加载
-(UILabel*)tilleLable
{
    if (!_tilleLable) {
        _tilleLable = [[UILabel alloc] initWithFrame:CGRectMake(60, 90, 200, 30)];
        _tilleLable.backgroundColor = [UIColor redColor];
        _tilleLable.textAlignment = NSTextAlignmentCenter ;
        [self.view addSubview:_tilleLable];
    }
    return _tilleLable;
}
#pragma mark 创建UIImageView懒加载
-(UIImageView*)imgView
{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(60, 120, 200, 200)];
        _imgView.backgroundColor = [UIColor redColor];
        _imgView.center = self.view.center;
        [self.view addSubview:_imgView];

    }
    return _imgView;
}

#pragma mark 创建上一张按钮懒加载
- (UIButton*)backButton
{
    if (!_backButton) {
        //创建上一张按钮
       _backButton = [[UIButton alloc]initWithFrame:CGRectMake(60, 360, 100, 40)];
        _backButton.backgroundColor = [UIColor blueColor];
        [_backButton setTitle:@"上一张" forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_backButton];
    }
    return _backButton;
}

#pragma mark 创建下一张按钮懒加载
- (UIButton*)nextButton
{
    if (!_nextButton) {
        //创建下一张按钮
        _nextButton = [[UIButton alloc]initWithFrame:CGRectMake(180, 360, 100, 40)];
        _nextButton.backgroundColor = [UIColor blueColor];
        [_nextButton setTitle:@"下一张" forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_nextButton];
    }
    return _nextButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showCurrentPage:0];
}
#pragma mark 上一张
-(void)back
{
    if (self.iIndex > 0) {
        self.iIndex --;
          [self showCurrentPage:self.iIndex];

    }
    
    
}
#pragma mark 下一张
-(void)next
{
    if (self.iIndex< self.arrayAll.count -1) {
        self.iIndex ++;
        [self showCurrentPage:self.iIndex];
    }
    
}
#pragma mark 显示当前页
-(void)showCurrentPage:(int) iPage
{
    if (iPage >= 0 || iPage <self.arrayAll.count) {
        singerModel * model = self.arrayAll[iPage];
        
        NSString *strTitle =[NSString stringWithFormat:@"%@ %d/%d",model.name,iPage+1,self.arrayAll.count];
        self.tilleLable.text = strTitle;
        
        self.imgView.image = [UIImage imageNamed:model.pic];
        if (iPage == 0) {
            self.backButton.enabled = NO;
            self.backButton.backgroundColor = [UIColor grayColor];
        }else
        {
            self.backButton.enabled = YES;
            self.backButton.backgroundColor = [UIColor blueColor];
        }
        if (iPage == self.arrayAll.count -1) {
            self.nextButton.enabled = NO;
            self.nextButton.backgroundColor = [UIColor grayColor];
        }else
        {
            self.nextButton.enabled = YES;
            self.nextButton.backgroundColor = [UIColor blueColor];
        }

    }
    
}

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

@end
