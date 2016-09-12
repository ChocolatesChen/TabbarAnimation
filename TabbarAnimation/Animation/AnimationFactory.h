//
//  AnimationFactory.h
//  TabbarAnimation
//
//  Created by Mac on 16/9/10.
//  Copyright © 2016年 Chocolate_chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationType.h"

@class TabBarItemAnimation;

@interface AnimationFactory : NSObject

+ (TabBarItemAnimation *)animationWithType:(AnimationType)type;

@end
