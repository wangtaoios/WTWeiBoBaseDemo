//
//  WTPanGestureRecognizer.m
//  WTWeiBoBaseDemo
//
//  Created by wangtao on 2018/3/26.
//  Copyright © 2018年 xbkg. All rights reserved.
//

#import "WTPanGestureRecognizer.h"


@interface WTPanGestureRecognizer () <UIGestureRecognizerDelegate>

@end

@implementation WTPanGestureRecognizer

- (instancetype)initWithTarget:(id)target action:(SEL)action {
    if (self = [super initWithTarget:target action:action]) {
        self.delegate = self;
    }
    return self;
}

#pragma mark - Gesture Delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([otherGestureRecognizer.view isKindOfClass:NSClassFromString(@"WMScrollView")]) {
        return NO;
    }
    return YES;
}

@end
