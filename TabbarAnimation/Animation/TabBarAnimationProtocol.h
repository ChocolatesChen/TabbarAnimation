//
//  TabBarAnimationProtocol.h
//  TabbarAnimation
//
//  Created by Mac on 16/9/10.
//  Copyright © 2016年 Chocolate_chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TabBarAnimationProtocol <NSObject>

- (void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel;

- (void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel;

- (void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel;

@end
