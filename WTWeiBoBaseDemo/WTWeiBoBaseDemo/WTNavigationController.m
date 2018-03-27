//
//  WTNavigationController.m
//  WTWeiBoBaseDemo
//
//  Created by wangtao on 2018/3/26.
//  Copyright © 2018年 xbkg. All rights reserved.
//

#import "WTNavigationController.h"

@interface WTNavigationController ()

@end

@implementation WTNavigationController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.interactivePopGestureRecognizer.delegate = nil;
    
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : [UIFont systemFontOfSize:18],
                                     NSForegroundColorAttributeName : [UIColor blackColor]
                                     };
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"navi_bg"];
    [[UINavigationBar appearance] setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem =
        [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"]
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
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
