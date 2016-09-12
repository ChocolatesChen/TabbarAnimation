//
//  CGAnimatedTabBarItem.h
//  TabbarAnimation
//
//  Created by Mac on 16/9/11.
//  Copyright © 2016年 Chocolate_chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarAnimationProtocol.h"

@class TabBarItemAnimation;

@interface CGAnimatedTabBarItem : UITabBarItem<TabBarAnimationProtocol>

@property (nonatomic, strong)TabBarItemAnimation *animation;

@end
