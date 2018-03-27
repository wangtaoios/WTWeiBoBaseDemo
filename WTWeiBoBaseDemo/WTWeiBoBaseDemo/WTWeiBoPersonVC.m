//
//  WTWeiBoPersonVC.m
//  WTWeiBoBaseDemo
//
//  Created by wangtao on 2018/3/26.
//  Copyright © 2018年 xbkg. All rights reserved.
//

#import "WTWeiBoPersonVC.h"
#import "WTTempTVC.h"

@interface WTWeiBoPersonVC ()

@end

@implementation WTWeiBoPersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"我的";
    
    WTTempTVC *vc1 = [[WTTempTVC alloc] init];
    WTTempTVC *vc2 = [[WTTempTVC alloc] init];
    WTTempTVC *vc3 = [[WTTempTVC alloc] init];
    
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    headerView.backgroundColor = [UIColor cyanColor];
    
    UIImageView *bgImageView = [[UIImageView alloc] init];
    [headerView addSubview:bgImageView];
    bgImageView.frame = headerView.bounds;
    bgImageView.image = [UIImage imageNamed:@"bear"];

    self.headerView = headerView;
    self.titleArrays = @[@"主页", @"微博", @"相册", ];
    self.vcArrays = @[vc1, vc2, vc3];

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
