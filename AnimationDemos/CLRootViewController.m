//
//  CLRootViewController.m
//  AnimationDemos
//
//  Created by Charles Leo  on 14-6-20.
//  Copyright (c) 2014年 Grace Leo. All rights reserved.
//

#import "CLRootViewController.h"

@interface CLRootViewController ()

@end

@implementation CLRootViewController
@synthesize mLabel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"星球环绕";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    //背景图片
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 329, 720/2)];
    imageView.image = [UIImage imageNamed:@"beijing.jpg"];
    [self.view addSubview:imageView];
    //环绕的球
    UIImageView * roundBall = [[UIImageView alloc]initWithFrame:CGRectMake(150, 220, 20, 20)];
    roundBall.image = [UIImage imageNamed:@"ball"];
    [self.view addSubview:roundBall];
    //环绕的动画
    CGRect boundingRect = CGRectMake(-150, -150, 300, 300);
    CAKeyframeAnimation * orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, Nil));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = kCAAnimationRotateAuto;
    [roundBall.layer addAnimation:orbit forKey:@"oribt"];
    //跳球
    UIImageView * jumpBall = [[UIImageView alloc]initWithFrame:CGRectMake(10, 380, 20, 20)];
    jumpBall.image = [UIImage imageNamed:@"ball"];
    [self.view addSubview:jumpBall];
    //传球
    UIImageView * passBall = [[UIImageView alloc]initWithFrame:CGRectMake(20, 350, 20, 20)];
    passBall.image = [UIImage imageNamed:@"ball"];
    [self.view addSubview:passBall];
    //平移的动画
    CABasicAnimation * passAnimation = [CABasicAnimation animation];
    passAnimation.keyPath = @"position.x";
    passAnimation.fromValue = @10;
    passAnimation.toValue = @320;
    passAnimation.duration = 1;
    passAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [passBall.layer addAnimation:passAnimation forKey:@"basic"];
    passBall.layer.position = CGPointMake(20, 350);
    //抖动控件
    UIImageView * shakeBall = [[UIImageView alloc]initWithFrame:CGRectMake(160, 410, 20, 20)];
    shakeBall.image = [UIImage imageNamed:@"ball"];
    [self.view addSubview:shakeBall];
    //抖动动画
    CAKeyframeAnimation * shakeAnimation = [CAKeyframeAnimation animation];
    shakeAnimation.keyPath = @"position.x";
    shakeAnimation.values = @[@0,@10,@-10,@10,@0];
    shakeAnimation.keyTimes = @[@0,@(1/6.0),@(3/6.0),@(5/6.0),@1];
    shakeAnimation.duration = 0.4;
    shakeAnimation.additive = YES;
    [shakeBall.layer addAnimation:shakeAnimation forKey:@"shake"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
