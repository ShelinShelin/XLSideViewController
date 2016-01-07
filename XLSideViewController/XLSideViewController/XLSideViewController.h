//
//  XLSideViewController.h
//  XLSideViewController
//
//  Created by Shelin on 16/1/6.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLSideViewController : UIViewController

@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, strong) UIViewController *mainViewController;
@property (nonatomic, assign) CGFloat moveDistance;
@property (nonatomic, assign) BOOL isSpringBack;//抽屉是否回弹的平移动画

- (instancetype)initWithMainViewController:(UIViewController *)mainViewController leftViewController:(UIViewController *)leftViewController;

@end
