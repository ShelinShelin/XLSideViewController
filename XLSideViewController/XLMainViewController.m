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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_caidan_topbar"] style:UIBarButtonItemStylePlain target:self action:@selector(sideViewShowOrHiden)];
}

- (void)sideViewShowOrHiden {
    
    XLSideViewController *sideViewController = (XLSideViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if (sideViewController.sideViewStatus == SideViewStatusHiden) {
        [sideViewController showSideView];
    }else {
        [sideViewController hidenSideView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)init {
    if ([super init]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"XLMainViewController" owner:nil options:nil].lastObject;
    }
    return self;
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
