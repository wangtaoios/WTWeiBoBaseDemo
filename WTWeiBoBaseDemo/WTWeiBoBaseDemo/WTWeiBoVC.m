//
//  WTWeiBoVC.m
//  WTWeiBoBaseDemo
//
//  Created by wangtao on 2018/3/26.
//  Copyright © 2018年 xbkg. All rights reserved.
//

#import "WTWeiBoVC.h"
#import "WTPanGestureRecognizer.h"

@interface WTWeiBoVC () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) WTPanGestureRecognizer *panGesture;
@property (nonatomic, assign) CGPoint lastPoint;

@property (nonatomic, assign) CGFloat headerViewH;

@end

@implementation WTWeiBoVC

- (instancetype)init {
    if (self = [super init]) {
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleColorSelected = [UIColor redColor];
        self.titleColorNormal = [UIColor darkGrayColor];
    }
    return self;
}

- (void)setHeaderView:(UIView *)headerView
{
    _headerView = headerView;
    
    [self.view addSubview:headerView];
    self.headerViewH = headerView.frame.size.height;
    self.viewTop = self.headerViewH;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.menuViewHeight = 44;
    self.headerViewH = 0;
    
    self.panGesture = [[WTPanGestureRecognizer alloc] initWithTarget:self action:@selector(panOnView:)];
    [self.view addGestureRecognizer:self.panGesture];
}

- (void)setMenuViewHeight:(CGFloat)menuViewHeight
{
    _menuViewHeight = menuViewHeight;
}

- (void)setTitleArrays:(NSArray *)titleArrays
{
    _titleArrays = titleArrays;
}

- (void)setVcArrays:(NSArray *)vcArrays
{
    _vcArrays = vcArrays;
    self.menuItemWidth = [UIScreen mainScreen].bounds.size.width / vcArrays.count;
    self.viewTop = self.headerViewH;
    
    [self reloadData];
}

- (void)panOnView:(WTPanGestureRecognizer *)recognizer {
    
    CGPoint currentPoint = [recognizer locationInView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.lastPoint = currentPoint;
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat targetPoint = velocity.y < 0 ? 0 : 0 + self.headerViewH;
        NSTimeInterval duration = fabs((targetPoint - self.viewTop) / velocity.y);
        
        if (fabs(velocity.y) * 1.0 > fabs(targetPoint - self.viewTop)) {
            NSLog(@"velocity: %lf", velocity.y);
            [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.viewTop = targetPoint;
            } completion:nil];
            
            return;
        }
        
    }
    CGFloat yChange = currentPoint.y - self.lastPoint.y;
    
    self.viewTop += yChange;
    self.lastPoint = currentPoint;
}

// MARK: ChangeViewFrame (Animatable)
- (void)setViewTop:(CGFloat)viewTop {
    _viewTop = viewTop;
    
    if (_viewTop <= 0) {
        _viewTop = 0;
    }
    
    if (_viewTop > self.headerViewH + 0) {
        _viewTop = self.headerViewH + 0;
    }
    
    self.headerView.frame = ({
        CGRect oriFrame = self.headerView.frame;
        oriFrame.origin.y = _viewTop - self.headerViewH;
        oriFrame;
    });
    
    [self forceLayoutSubviews];
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.vcArrays.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return self.vcArrays[index];
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArrays[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    return CGRectMake(0, _viewTop, self.view.frame.size.width, self.menuViewHeight);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + self.menuViewHeight;
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
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
