//
//  XLSideViewController.h
//  XLSideViewController
//  https://github.com/ShelinShelin
//  Created by Shelin on 16/1/6.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLSideViewController : UIViewController

@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, strong) UIViewController *mainViewController;
@property (nonatomic, assign) CGFloat moveDistance;
@property (nonatomic, assign, getter=isSpringBack) BOOL springBack;      //  default is YES

- (instancetype)initWithMainViewController:(UIViewController *)mainViewController leftViewController:(UIViewController *)leftViewController;

+ (void)showSideView;

+ (void)hidenSideView;

@end
