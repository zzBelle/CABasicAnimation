//
//  ViewController.m
//  BelleCABasicAnimation
//
//  Created by 十月 on 17/4/5.
//  Copyright © 2017年 October. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //平移动画
    //    [self translationAnimation];
    //路径动画
    //    [self baseAnimation];
    //闪烁动画
    //    [self baseSpringAnimation];
    //旋转动画
    [self baseRotationAnimation];
    //缩放动画
    //    [self baseScaleAnimation];
}

- (void) translationAnimation {
    UIView *springView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    springView.backgroundColor = [UIColor orangeColor];
    springView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    springView.layer.borderWidth = 2.0;
    [self.view addSubview:springView];
    
    /*
     CAAnimation 是一个抽象类， 遵循了CAMediaTiming协议和CAAction协议 我们不能直接使用CAAnimation类 而是使用其子类；
     CATransition：提供渐变效果，比如推拉push效果，消退fade效果，揭开reveal 效果
     CAAnimationGroup 允许多个动画同时播放
     CABasicAnimation 提供了对单一动画的实现
     CAKeyframeAnimation 关键帧动画 可以定义动画路线
     CAPropertyAnimation 属性动画 通常不直接使用，而是使用CABasicAnimation子类
     */
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    animation.duration = 2;
    animation.cumulative = YES;
    animation.removedOnCompletion = YES;
    animation.repeatCount = HUGE_VALF; //设置无限循环动画
    //设置动画完成时，自动返回到原点
    animation.autoreverses = YES;
    
    //设置动画完成，返回到原点
    animation.fillMode = kCAFillModeForwards;
    
    //设置动画效果为快入快出
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    //设置属性tovalue
    CGPoint toValue = CGPointMake(self.view.frame.size.width - 50, 0);
    
    animation.byValue = [NSValue valueWithCGPoint:toValue];
    
    //添加到动画图层上
    [springView.layer addAnimation:animation forKey:@"transform.translation"];
    
}

- (void) baseAnimation {
    UIView *springView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    springView.backgroundColor = [UIColor redColor];
    springView.layer.borderColor = [UIColor greenColor].CGColor;
    springView.layer.borderWidth = 2.0;
    [self.view addSubview:springView];
    //创建动画
    CABasicAnimation *baseAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    baseAnimation.duration = 3.0;
    baseAnimation.repeatCount = HUGE_VALF;
    baseAnimation.fillMode = kCAFillModeForwards;
    baseAnimation.speed = 0.5; //设置动画速度
    baseAnimation.beginTime = 0.0;
    baseAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //设置起点
    baseAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    //    baseAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    baseAnimation.byValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    [springView.layer addAnimation:baseAnimation forKey:@"position"];
    
}


- (void)baseSpringAnimation {
    UIView *springView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    springView.backgroundColor = [UIColor redColor];
    springView.layer.borderColor = [UIColor orangeColor].CGColor;
    springView.layer.borderWidth = 2.0;
    [self.view addSubview:springView];
    CABasicAnimation *springAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    springAnimation.duration = 3.0;
    springAnimation.repeatCount = HUGE_VALF;
    springAnimation.autoreverses = YES;
    springAnimation.removedOnCompletion = NO;
    springAnimation.fillMode = kCAFillModeForwards;
    springAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    springAnimation.fromValue = @(1);
    springAnimation.toValue = @(0);
    [springView.layer addAnimation:springAnimation forKey:@"opactiy"];
}

- (void)baseScaleAnimation {
    UIView *springView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    springView.backgroundColor = [UIColor redColor];
    springView.layer.borderColor = [UIColor blackColor].CGColor;
    springView.layer.borderWidth = 2.0;
    [self.view addSubview:springView];
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.duration = 3.0;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.repeatCount = HUGE_VALF;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    scaleAnimation.fromValue = @(1);
    scaleAnimation.toValue = @(0);
    [springView.layer addAnimation:scaleAnimation forKey:@"transfrom.scale"];
}

- (void)baseRotationAnimation {
    UIView *springView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    springView.backgroundColor = [UIColor redColor];
    springView.layer.borderColor = [UIColor blackColor].CGColor;
    springView.layer.borderWidth = 2.0;
    [self.view addSubview:springView];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    rotationAnimation.duration = 2;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    rotationAnimation.autoreverses = YES;
    rotationAnimation.removedOnCompletion = NO;
    CATransform3D transform3D = CATransform3DMakeRotation(M_PI, 0, 0, M_PI);
    NSValue *value = [NSValue valueWithCATransform3D:transform3D];
    rotationAnimation.toValue = value;
    [springView.layer addAnimation:rotationAnimation forKey:@"transform"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
