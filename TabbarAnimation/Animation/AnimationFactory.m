//
//  AnimationFactory.m
//  TabbarAnimation
//
//  Created by Mac on 16/9/10.
//  Copyright © 2016年 Chocolate_chen. All rights reserved.
//

#import "AnimationFactory.h"
#import "TabBarItemAnimation.h"
#import "FumeAnimation.h"
#import "FrameAnimation.h"
#import "BounceAnimation.h"
#import "RotationAnimation.h"
#import "TransitionAnimation.h"

@implementation AnimationFactory

+ (TabBarItemAnimation *)animationWithType:(AnimationType)type
{
    switch (type) {
        case FumeAnimationType:
            return [FumeAnimation new];
            break;
            
        case FrameAnimationType:
            return [FrameAnimation new];
            break;
            
        case TransitionAnimationType:
            return [TransitionAnimation new];
            break;
            
        case BounceAnimationType:
            return [BounceAnimation new];
            break;
            
        case RotationAnimationType:
            return [RotationAnimation new];
            break;
            
        default:
            break;
    }
    
    return nil;
}
@end
