//
//  TabBarItemAnimation.m
//  TabbarAnimation
//
//  Created by Mac on 16/9/10.
//  Copyright © 2016年 Chocolate_chen. All rights reserved.
//

#import "TabBarItemAnimation.h"

@implementation TabBarItemAnimation

- (instancetype)init{
    if (self = [super init]) {
        _defaultTextColor = [UIColor blackColor];
        _textSelectedColor = [UIColor redColor];
        _iconSelectedColor = [UIColor redColor];
        _duration = 0.2;
    }
    return self;
}
- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    
}
- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    
}
- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    
}
@end
