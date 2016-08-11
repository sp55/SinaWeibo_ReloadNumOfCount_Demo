//
//  ViewController.m
//  SinaWeibo_ReloadNumOfCount_Demo
//
//  Created by admin on 16/8/11.
//  Copyright © 2016年 AlezJi. All rights reserved.
//http://www.jianshu.com/p/83eeab07e2d9
//新浪微博下拉刷新显示最新微博数动画控件的实现


#import "ViewController.h"


@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@end


@implementation UIView (Extension)
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}
@end


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
//显示最新微博数量
-(void)showNewStatusCount:(int )count{
    //创建Label
    UILabel *label=[[UILabel alloc]init];
    //设置Label的背景图片
    label.backgroundColor=[UIColor orangeColor];
    label.width=[UIScreen mainScreen].bounds.size.width;
    label.height=35;
    //设置其他属性
    if (count==0) {
        label.text=@"没有新的微博数据，请稍后再试";
    }else{
        label.text=[NSString stringWithFormat:@"共有%d条新的微博数据",count];
    }
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:16];
    label.textAlignment=NSTextAlignmentCenter;
    label.y=64-label.height;
    //将label添加到导航栏控制器的view中，并且是盖在导航栏下边
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    //动画设置
    CGFloat duration=1.0; //通过定义动画执行的时间来控制动过程的速度
    [UIView animateWithDuration:duration animations:^{
        label.transform=CGAffineTransformMakeTranslation(0, label.height);
    } completion:^(BOOL finished) {
        CGFloat delay=1.0; //定义控件悬停的时间
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
            label.transform=CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            //动画控件执行完整个过程后将其从父视图移除
            [label removeFromSuperview];
        }];
    }];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showNewStatusCount:5];
    
}


@end
