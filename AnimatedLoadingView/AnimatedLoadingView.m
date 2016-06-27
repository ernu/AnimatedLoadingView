//
//  AnimatedLoadingView.m
//  AnimatedLoadingView
//
//  Created by ekim on 4/11/16.
//  Copyright © 2016 ernu. All rights reserved.
//

#import "AnimatedLoadingView.h"

@interface AnimatedLoadingView ()

{
@private
    UIColor *backgroundColor;
    UIColor *firstColor;
    UIColor *secondColor;
    CAShapeLayer *circleLayer;
    CAAnimationGroup *strokeAnimationGroup;
    CAAnimationGroup *colorAnimationGroup;
    CABasicAnimation *rotateAnimation;
}

@end

const CGFloat kMLLoadingRadius = 35.0;
const CGFloat kMLLoadingLineWidth = 4.0;
const CGFloat kMLLoadingStrokeAnimDuration = 0.75;
const CGFloat kMLLoadingStrokeStartBegin = 0.5;
const CGFloat kMLLoadingCicleAnimDuration = kMLLoadingStrokeAnimDuration + kMLLoadingStrokeStartBegin;
const CGFloat kMLLoadingRotationDuration = 2.0;

@implementation AnimatedLoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        firstColor = [UIColor blueColor];
        secondColor = [UIColor yellowColor];
        [self loadView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor firstColor:(UIColor *)fColor secondColor:(UIColor *)sColor
{
    self = [super initWithFrame:frame];
    if (self) {
        if (bgColor) backgroundColor = bgColor;
        else backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        
        if (fColor) firstColor = fColor;
        else firstColor = [UIColor blueColor];
        
        if (sColor) secondColor = sColor;
        else secondColor = [UIColor yellowColor];
        
        [self loadView];
    }
    return self;
}

- (void)loadView
{
    [self setHidden:YES];
    [self setBackgroundColor:backgroundColor];
    circleLayer = [CAShapeLayer layer];
    circleLayer.bounds = CGRectMake(0, 0, 2.0*kMLLoadingRadius, 2.0*kMLLoadingRadius);
    circleLayer.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:circleLayer.bounds];
    circleLayer.path = circle.CGPath;
    
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    circleLayer.strokeColor = firstColor.CGColor;
    circleLayer.lineWidth   = kMLLoadingLineWidth;
    
    circleLayer.strokeStart = 0.0f;
    circleLayer.strokeEnd = 1;
    
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration          = kMLLoadingStrokeAnimDuration;
    strokeEndAnimation.beginTime         = 0;
    strokeEndAnimation.fromValue         = @0;
    strokeEndAnimation.toValue           = @1;
    
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.duration          = kMLLoadingStrokeAnimDuration;
    strokeStartAnimation.beginTime         = kMLLoadingStrokeStartBegin;
    strokeStartAnimation.fromValue         = @0;
    strokeStartAnimation.toValue           = @1;
    
    strokeAnimationGroup = [CAAnimationGroup animation];
    strokeAnimationGroup.duration          = kMLLoadingCicleAnimDuration;
    strokeAnimationGroup.repeatCount       = INFINITY;
    [strokeAnimationGroup setAnimations:[NSArray arrayWithObjects:strokeEndAnimation, strokeStartAnimation, nil]];
    
    CABasicAnimation *colorEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
    colorEndAnimation.duration          = 0.1;
    colorEndAnimation.beginTime         = 0;
    colorEndAnimation.toValue           = (id)firstColor.CGColor;
    colorEndAnimation.fillMode          = kCAFillModeForwards;
    colorEndAnimation.timeOffset        = 0;
    
    CABasicAnimation *colorStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
    colorStartAnimation.duration          = 0.1;
    colorStartAnimation.beginTime         =  kMLLoadingCicleAnimDuration;
    colorStartAnimation.toValue           = (id)secondColor.CGColor;
    colorStartAnimation.fillMode          = kCAFillModeForwards;
    colorStartAnimation.timeOffset        = 0;
    
    colorAnimationGroup = [CAAnimationGroup animation];
    colorAnimationGroup.duration = kMLLoadingCicleAnimDuration * 2;
    colorAnimationGroup.repeatCount = INFINITY;
    [colorAnimationGroup setAnimations:[NSArray arrayWithObjects:colorEndAnimation, colorStartAnimation, nil]];
    
    rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.duration          = kMLLoadingRotationDuration;
    rotateAnimation.fromValue         = @0;
    rotateAnimation.toValue           = [NSNumber numberWithDouble:2*M_PI];
    rotateAnimation.repeatCount       = INFINITY;
    rotateAnimation.fillMode          = kCAFillModeForwards;
    rotateAnimation.additive          = YES;
    
    [self.layer addSublayer:circleLayer];
}

- (void)start
{
    [self setHidden:NO];
    [circleLayer addAnimation:strokeAnimationGroup forKey:@"animateStroke"];
    [circleLayer addAnimation:colorAnimationGroup forKey:@"animateColor"];
    [circleLayer addAnimation:rotateAnimation forKey:@"animateRotation"];
}

- (void)stop
{
    [self setHidden:YES];
    [circleLayer removeAnimationForKey:@"animateStroke"];
    [circleLayer removeAnimationForKey:@"animateColor"];
    [circleLayer removeAnimationForKey:@"animateRotation"];
}

@end