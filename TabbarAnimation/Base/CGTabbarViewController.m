//
//  CGTabbarViewController.m
//  TabbarAnimation
//
//  Created by Mac on 16/9/10.
//  Copyright © 2016年 Chocolate_chen. All rights reserved.
//

#import "CGTabbarViewController.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "FourthVC.h"
#import "Fiveth.h"
#import "CGAnimatedTabBarItem.h"
#import "AnimationFactory.h"

#define MAS_SHORTHAND_GLOBALS
#define MAS_SHORTHAND
#import <Masonry.h>
typedef enum
{
    ImageViewTag = 100,
    LabelTag,
}AnimationTabBarControllerTag;

@interface CGTabbarViewController ()
{
    NSMutableArray *_viewControllersArr;
    NSMutableArray *_containers;
}
@end

@implementation CGTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _viewControllersArr = [NSMutableArray arrayWithCapacity:1];
    // 初始化所有的子控制器
    [self setupChildViewControllers];
    _containers = [self createViewContainers];
    [self createCustomIcons:_containers];
}
- (void)setupChildViewControllers{

    [self setupOneChildViewController:[[FirstVC alloc]init] title:@"首页" image:[NSString stringWithFormat:@"BarItemNormal1"] animationType:BounceAnimationType];
    [self setupOneChildViewController:[[SecondVC alloc]init] title:@"分类" image:[NSString stringWithFormat:@"BarItemNormal2"] animationType:TransitionAnimationType];
    [self setupOneChildViewController:[[ThirdVC alloc]init] title:@"精华" image:[NSString stringWithFormat:@"BarItemNormal3"] animationType:FumeAnimationType];
    [self setupOneChildViewController:[[FourthVC alloc]init] title:@"购物车" image:[NSString stringWithFormat:@"BarItemNormal4"] animationType:RotationAnimationType];
    [self setupOneChildViewController:[[Fiveth alloc]init] title:@"我" image:[NSString stringWithFormat:@"BarItemNormal5"] animationType:FumeAnimationType];
    self.viewControllers = _viewControllersArr;
}
- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image animationType:(AnimationType)type
{
    vc.title = title;
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:vc];
    
    CGAnimatedTabBarItem *animatedTb = [[CGAnimatedTabBarItem alloc] init];
    animatedTb.animation = [AnimationFactory animationWithType:type];
    animatedTb.title = title;
    animatedTb.image = [UIImage imageNamed:image];
    vc.tabBarItem = animatedTb;
    [_viewControllersArr addObject:navigationVC];
}
/**
 *  创建tabbar的图片和label
 */
- (void)createCustomIcons:(NSMutableArray *)containers
{
    [self.tabBar.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CGAnimatedTabBarItem *tabBarItem = obj;
        
        UIView *container = containers[idx];
        container.tag = idx;
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:tabBarItem.image];
        imageView.tag = ImageViewTag;
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [container addSubview:imageView];
        
        [imageView makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(tabBarItem.image.size);
            make.centerY.equalTo(container).offset(-5);
            make.centerX.equalTo(container);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:10];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = LabelTag;
        label.text = tabBarItem.title;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [container addSubview:label];
        
        CGFloat width = self.tabBar.frame.size.width / self.tabBar.items.count;
        
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(width, 10));
            make.centerY.equalTo(container).offset(16);
            make.centerX.equalTo(container);
        }];
        
        if (idx == 0)
        {
            [tabBarItem selectedState:imageView textLabel:label];
        }
        
        // 去除原有设置
        tabBarItem.title = @"";
        tabBarItem.image = nil;
    }];
}

- (NSMutableArray *)createViewContainers
{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:1];
    NSInteger count = self.tabBar.items.count;
    
    for (NSInteger i = 0; i < count; i++)
    {
        UIView *viewContainer = [self createViewContainer];
        [arr addObject:viewContainer];
    }
    
    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0.0 leadSpacing:0.0 tailSpacing:0.0];
    
    return arr;
}

- (UIView *)createViewContainer
{
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    [view addGestureRecognizer:tapGesture];
    
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.height.equalTo(self.tabBar);
    }];
    
    return view;
}

- (void)tapAction:(UITapGestureRecognizer *)gesture
{
    NSInteger currentIndex = gesture.view.tag;
    if (self.selectedIndex != currentIndex)
    {
        // 现在选中
        CGAnimatedTabBarItem *item = (CGAnimatedTabBarItem *)self.tabBar.items[currentIndex];
        UIView *container = _containers[currentIndex];
        UIImageView *imageView = (UIImageView *)[container viewWithTag:ImageViewTag];;
        UILabel *label = (UILabel *)[container viewWithTag:LabelTag];
        [item playAnimation:imageView textLabel:label];
        
        // 之前选中
        item = (CGAnimatedTabBarItem *)self.tabBar.items[self.selectedIndex];
        container = _containers[self.selectedIndex];
        imageView = (UIImageView *)[container viewWithTag:ImageViewTag];;
        label = (UILabel *)[container viewWithTag:LabelTag];
        [item deselectAnimation:imageView textLabel:label];
        
        self.selectedIndex = currentIndex;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
