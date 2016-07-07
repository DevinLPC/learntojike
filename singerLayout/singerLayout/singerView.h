//
//  singerView.h
//  singerLayout
//
//  Created by mayee on 16/7/7.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singerModel.h"

@interface singerView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *singerViewImage;
@property (weak, nonatomic) IBOutlet UILabel *singerViewLabel;
@property (weak, nonatomic) IBOutlet UIButton *singerViewButton;
@property (nonatomic, strong) singerModel *model;

+ (instancetype)share;

@end
