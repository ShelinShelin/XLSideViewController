//
//  XLSideViewController.h
//  XLSideViewController
//  https://github.com/ShelinShelin
//  Created by Shelin on 16/1/6.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XLSideViewStatus) {
    SideViewStatusHiden = 0,    //status hiden
    SideViewStatusShow = 1      //status show
};

@interface XLSideViewController : UIViewController

@property (nonatomic, strong) UIViewController *leftViewController;
@property (nonatomic, strong) UIViewController *mainViewController;
@property (nonatomic, assign) XLSideViewStatus sideViewStatus;

- (instancetype)initWithMainViewController:(UIViewController *)mainViewController leftViewController:(UIViewController *)leftViewController;

- (void)showSideView;

- (void)hidenSideView;

@end
