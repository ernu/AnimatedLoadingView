//
//  AnimatedLoadingView.h
//  AnimatedLoadingView
//
//  Created by ekim on 4/11/16.
//  Copyright © 2016 ernu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimatedLoadingView : UIView

- (id)initWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor firstColor:(UIColor *)fColor secondColor:(UIColor *)sColor;
- (void)start;
- (void)stop;

@end
