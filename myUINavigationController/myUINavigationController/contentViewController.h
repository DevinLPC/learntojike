//
//  contentViewController.h
//  myUINavigationController
//
//  Created by mayee on 16/7/8.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contentViewController : UIViewController
@property(nonatomic,copy) NSString *content;

+ (void)setContent:(NSString*)str;

@end
