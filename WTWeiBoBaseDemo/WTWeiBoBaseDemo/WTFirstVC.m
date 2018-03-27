//
//  WTFirstVC.m
//  WTWeiBoBaseDemo
//
//  Created by wangtao on 2018/3/26.
//  Copyright © 2018年 xbkg. All rights reserved.
//

#import "WTFirstVC.h"
#import "WTWeiBoPersonVC.h"
#import "WTTempTVC.h"

@interface WTFirstVC ()

@end

@implementation WTFirstVC

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    WTWeiBoPersonVC *vc = [[WTWeiBoPersonVC alloc] init];
//
//    WTTempTVC *vc1 = [[WTTempTVC alloc] init];
//    WTTempTVC *vc2 = [[WTTempTVC alloc] init];
//    WTTempTVC *vc3 = [[WTTempTVC alloc] init];
//    
//    UIView *headerView = [[UIView alloc] init];
//    headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
//    headerView.backgroundColor = [UIColor cyanColor];
//    
//    vc.headerView = headerView;
//    vc.titleArrays = @[@"主页", @"微博", @"相册", ];
//    vc.vcArrays = @[vc1, vc2, vc3];
//    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"点击页面跳转";
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
