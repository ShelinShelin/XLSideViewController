//
//  XLMainViewController.m
//  XLSideViewController
//  https://github.com/ShelinShelin
//  Created by Shelin on 16/1/6.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import "XLMainViewController.h"
#import "XLSideViewController.h"

@interface XLMainViewController ()

@end

@implementation XLMainViewController

- (instancetype)init {
    if ([super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"XLMainViewController" owner:nil options:nil].lastObject;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"active_h"] style:UIBarButtonItemStylePlain target:self action:@selector(sideViewShowOrHiden)];
}

- (void)sideViewShowOrHiden {
    
    XLSideViewController *sideViewController = (XLSideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if (sideViewController.sideViewStatus == SideViewStatusHiden) {
        [XLSideViewController showSideView];
        sideViewController.sideViewStatus = SideViewStatusShow;
    }else {
        [XLSideViewController hidenSideView];
        sideViewController.sideViewStatus = SideViewStatusHiden;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
