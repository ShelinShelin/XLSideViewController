//
//  XLSideViewController.m
//  XLSideViewController
//  https://github.com/ShelinShelin
//  Created by Shelin on 16/1/6.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import "XLSideViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

static CGFloat const kIphone6PlusHeight = 667.0f;
static CGFloat const kIphone6PlusWidth = 414.0f;
static NSTimeInterval const kAnimateDuration = 0.3f;

static CGFloat kDefaultHeightZoomScale = 500.0f;
static CGFloat kDefaultMoveDistance = 300.0f;

@interface XLSideViewController ()
{
    UIPanGestureRecognizer *_panGestureRecognizer;
    UIView *_mainView;
    UIView *_leftView;
}
@end

@implementation XLSideViewController

#pragma mark - initialize and methods

- (instancetype)initWithMainViewController:(UIViewController *)mainViewController leftViewController:(UIViewController *)leftViewController {
    self = [super init];
    if (self) {
        kDefaultHeightZoomScale = kScreenHeight * (kDefaultHeightZoomScale / kIphone6PlusHeight);
        kDefaultMoveDistance = kScreenWidth * (kDefaultMoveDistance / kIphone6PlusWidth);
        [self setSpringBack:YES];
        _mainView = mainViewController.view;
        _leftView = leftViewController.view;
        _moveDistance = kDefaultMoveDistance;
        _springBack = YES;
        _panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
        [self.view addGestureRecognizer:_panGestureRecognizer];
        self.leftViewController = leftViewController;
        self.mainViewController = mainViewController;
    }
    return self;
}

+ (void)showSideView {
    
}

+ (void)hidenSideView {
    
}


#pragma mark - setter

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

- (void)setSpringBack:(BOOL)springBack {
    if (_springBack != springBack) {
        _springBack = springBack;
    }
}

#pragma mark - pan

- (void)pan:(UIPanGestureRecognizer*)panGesture {
    
    CGFloat detalX = [panGesture translationInView:self.view].x;
    CGFloat velocityX= [panGesture velocityInView:self.view].x;
    
    __block CGRect tempFrame = _mainView.frame;
    tempFrame.origin.x += detalX;
    tempFrame.origin.x = tempFrame.origin.x >= 0 ? tempFrame.origin.x : 0;
    tempFrame.origin.x = tempFrame.origin.x <= self.moveDistance ? tempFrame.origin.x : self.moveDistance;
    tempFrame.size.height = kScreenHeight - ((kScreenHeight - kDefaultHeightZoomScale) * tempFrame.origin.x / kDefaultMoveDistance);
    tempFrame.origin.y = (kScreenHeight - tempFrame.size.height) / 2;
    
    if (panGesture.state == UIGestureRecognizerStateEnded) {
    
        if (self.isSpringBack) {
            if (tempFrame.origin.x < kDefaultMoveDistance / 2) {
                [UIView animateWithDuration:kAnimateDuration animations:^{
                    tempFrame.origin.x = 0;
                    tempFrame.origin.y = 0;
                    tempFrame.size.height = kScreenHeight;
                    _mainView.frame = tempFrame;
                }];
            } else {
                [UIView animateWithDuration:kAnimateDuration animations:^{
                    tempFrame.origin.x = kDefaultMoveDistance;
                    tempFrame.origin.y = (kScreenHeight - kDefaultHeightZoomScale) / 2;
                    tempFrame.size.height = kDefaultHeightZoomScale;
                    _mainView.frame = tempFrame;
                }];
            }
        } else {
            if (velocityX > 0) {
                [UIView animateWithDuration:kAnimateDuration animations:^{
                    tempFrame.origin.x = kDefaultMoveDistance;
                    tempFrame.origin.y = (kScreenHeight - kDefaultHeightZoomScale) / 2;
                    tempFrame.size.height = kDefaultHeightZoomScale;
                    _mainView.frame = tempFrame;
                }];
            } else {
                [UIView animateWithDuration:kAnimateDuration animations:^{
                    tempFrame.origin.x = 0;
                    tempFrame.origin.y = 0;
                    tempFrame.size.height = kScreenHeight;
                    _mainView.frame = tempFrame;
                }];
            }
        }
    }
    _mainView.frame = tempFrame;
    [panGesture setTranslation:CGPointZero inView:self.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
