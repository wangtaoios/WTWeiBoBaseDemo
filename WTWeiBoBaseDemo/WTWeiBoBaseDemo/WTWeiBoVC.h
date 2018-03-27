//
//  WTWeiBoVC.h
//  WTWeiBoBaseDemo
//
//  Created by wangtao on 2018/3/26.
//  Copyright © 2018年 xbkg. All rights reserved.
//

#import <WMPageController/WMPageController.h>

@interface WTWeiBoVC : WMPageController

@property (nonatomic, assign) CGFloat viewTop;
@property (nonatomic, assign) CGFloat menuViewHeight;

@property (nonatomic, strong) NSArray *titleArrays;
@property (nonatomic, strong) NSArray *vcArrays;
@property (nonatomic, strong) UIView *headerView;

@end
