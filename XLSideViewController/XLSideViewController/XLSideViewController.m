//
//  XLSideViewController.m
//  XLSideViewController
//
//  Created by Shelin on 16/1/6.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import "XLSideViewController.h"

#define kDefaultMoveDistance 300

@interface XLSideViewController ()
{
    UIPanGestureRecognizer *_panGestureRecognizer;
    UIView *_mainView;
    UIView *_leftView;
}
@end

@implementation XLSideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (instancetype)initWithMainViewController:(UIViewController *)mainViewController leftViewController:(UIViewController *)leftViewController {
    self = [super init];
    if (self) {
        
        _mainView = mainViewController.view;
        _leftView = leftViewController.view;
        _moveDistance = kDefaultMoveDistance;
        _isSpringBack = YES;
        _panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
        [self.view addGestureRecognizer:_panGestureRecognizer];
        
        self.leftViewController = leftViewController;
        self.mainViewController = mainViewController;
    }
    return self;
}

- (void)setLeftViewController:(UIViewController *)leftViewController {
    if (_leftViewController != leftViewController) {
        _leftViewController = leftViewController;
        [self addChildViewController:leftViewController];
        [self.view addSubview:leftViewController.view];
    }
}

- (void)setMainViewController:(UIViewController *)mainViewController {
    if (_mainViewController != mainViewController) {
        _mainViewController = mainViewController;
        [self addChildViewController:mainViewController];
        [self.view addSubview:mainViewController.view];
    }
}

- (void)pan:(UIPanGestureRecognizer*)panGesture {
    
    CGFloat detalX = [panGesture translationInView:self.view].x;
    CGRect tempFrame = _mainView.frame;
    tempFrame.origin.x += detalX;
    tempFrame.origin.x = tempFrame.origin.x >= 0 ? tempFrame.origin.x : 0;
    tempFrame.origin.x = tempFrame.origin.x <= self.moveDistance ? tempFrame.origin.x : self.moveDistance;
    _mainView.frame = tempFrame;
    [panGesture setTranslation:CGPointZero inView:self.view];
}

@end
