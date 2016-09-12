//
//  CGAnimatedTabBarItem.m
//  TabbarAnimation
//
//  Created by Mac on 16/9/11.
//  Copyright © 2016年 Chocolate_chen. All rights reserved.
//

#import "CGAnimatedTabBarItem.h"
#import "TabBarItemAnimation.h"
#import "AnimationFactory.h"
@interface CGAnimatedTabBarItem()

@end

@implementation CGAnimatedTabBarItem
-(void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    assert(_animation != nil);
    
    [_animation playAnimation:icon textLabel:textLabel];
}
-(void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    assert(_animation != nil);
    
    [_animation deselectAnimation:icon textLabel:textLabel];
}
-(void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    assert(_animation != nil);
    
    [_animation selectedState:icon textLabel:textLabel];
}
@end
