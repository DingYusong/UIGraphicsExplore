//
//  DYSDemo01ViewController.m
//  UIGraphicsExplore
//
//  Created by 丁玉松 on 2018/11/13.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo01ViewController.h"
#import "DYSDemo1View.h"

@interface DYSDemo01ViewController ()

@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation DYSDemo01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self yyi_drawOctagon];
    
    [self yyi_addCustomView];
    
//    [self yyi_addCustomView2];
    
//    [self yyi_addCustomView3];
}

- (void)yyi_addCustomView2 {
    UIGraphicsBeginImageContext(CGSizeMake(400, 400));
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    [[UIColor redColor] setFill];
    [path fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //线路和画布的大小没有关系
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(80, 180, 200, 200);
    imageView.contentMode = UIViewContentModeCenter;
    imageView.layer.masksToBounds = YES;
    [self.view addSubview:imageView];
}

- (void)yyi_addCustomView3 {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 1);
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(ref, CGRectMake(0, 0, 100, 100));
    CGContextSetFillColorWithColor(ref, [UIColor redColor].CGColor);
    
    CGContextFillPath(ref);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    //线路和画布的大小没有关系
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(80, 180, 200, 200);
    imageView.contentMode = UIViewContentModeCenter;
    imageView.layer.masksToBounds = YES;
    [self.view addSubview:imageView];
}

- (void)yyi_addCustomView {
    DYSDemo1View *view = [DYSDemo1View new];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(0, 0, 400, 400);
    view.center = self.view.center;
    [self.view addSubview:view];
    
    [view setNeedsDisplay];
//    [view setNeedsDisplayInRect:CGRectMake(0, 0, 100, 100)];
    //会调用drawRect方法
}

- (void)yyi_drawOctagon {

    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(16.72, 7.22)];
//    [path addLineToPoint:CGPointMake(3.29, 20.83)];
//    [path addLineToPoint:CGPointMake(0.4, 18.05)];
//    [path addLineToPoint:CGPointMake(18.8, -0.47)];
//    [path addLineToPoint:CGPointMake(37.21, 18.05)];
//    [path addLineToPoint:CGPointMake(34.31, 20.83)];
//    [path addLineToPoint:CGPointMake(20.88, 7.22)];
//    [path addLineToPoint:CGPointMake(20.88, 42.18)];
//    [path addLineToPoint:CGPointMake(16.72, 42.18)];
//    [path addLineToPoint:CGPointMake(16.72, 7.22)];
//    [path closePath];
//    path.lineWidth = 1;
//    [[UIColor redColor] setStroke];
//    [path stroke];
    
    
    
//    CGPoint layerCenter = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetWidth(self.view.frame)/2);
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.frame = self.view.bounds;
//    layer.lineWidth = 6.0;
//    layer.strokeColor = [UIColor redColor].CGColor;
//    layer.fillColor = [UIColor blueColor].CGColor;
//
//    self.path = [UIBezierPath bezierPath];
//    [self.path addArcWithCenter:layerCenter radius:50 startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
//    layer.path = self.path.CGPath;
//
//    UIGraphicsBeginImageContext(self.view.bounds.size);
//    [self.path stroke];
//    [self.path fill];
//    UIGraphicsEndImageContext();
//
//    [self.view.layer addSublayer:layer];
    
    
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];   //创建CALayer对象
    shapeLayer.frame = CGRectMake(0, 0, 200, 200);   //设置frame
    shapeLayer.position = self.view.center;           //将shapeLayer放在视图的中心
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, 200, 200)]; //使用贝塞尔曲线绘制一个圆形的路径
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 200, 200)]; //使用贝塞尔曲线绘制一个圆形的路径
    
    
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(16.72, 7.22)];
        [path addLineToPoint:CGPointMake(3.29, 20.83)];
        [path addLineToPoint:CGPointMake(0.4, 18.05)];
        [path addLineToPoint:CGPointMake(18.8, -0.47)];
        [path addLineToPoint:CGPointMake(37.21, 18.05)];
        [path addLineToPoint:CGPointMake(34.31, 20.83)];
        [path addLineToPoint:CGPointMake(20.88, 7.22)];
        [path addLineToPoint:CGPointMake(20.88, 42.18)];
        [path addLineToPoint:CGPointMake(16.72, 42.18)];
        [path addLineToPoint:CGPointMake(16.72, 7.22)];
        [path closePath];
//        path.lineWidth = 1;
//        [[UIColor redColor] setStroke];
//        [path stroke];

    
    
    
    
    path.lineCapStyle = kCGLineCapRound;    //贝塞尔线段端点格式  (该demo暂不做详细介绍 请参考我的其他博文有详细介绍)
    path.lineJoinStyle = kCGLineJoinRound;  //贝塞尔线段连接点格式 (该demo暂不做详细介绍 请参考我的其他博文有详细介绍)
    shapeLayer.path = path.CGPath;   //将shapeLayer的路径设置为绘制好的贝塞尔曲线(圆形)
    
    shapeLayer.fillColor = [UIColor redColor].CGColor;  //设置填充颜色
    shapeLayer.backgroundColor = [UIColor greenColor].CGColor;  //设置背景颜色
    
    shapeLayer.borderWidth = 4;                          //设置边框宽度
    shapeLayer.borderColor = [UIColor blueColor].CGColor; //设置边框颜色
    
    shapeLayer.shadowColor = [UIColor grayColor].CGColor;   //设置阴影颜色
    shapeLayer.shadowOffset = CGSizeMake(5, 15);             //设置阴影偏移量
    shapeLayer.shadowOpacity = 0.6;                        //设置阴影的透明度  默认为透明的 0.0
    
    shapeLayer.cornerRadius = 13;             //设置圆角
    shapeLayer.masksToBounds = true;          //将超出主图层范围的内容切掉  在UIView里这一属性对应的方法是clipsToBounds
    
    shapeLayer.lineWidth = 20;               //设置路径宽度(使用贝塞尔曲线绘制的路径宽度)
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;  //设置路径颜色
    
    [self.view.layer addSublayer:shapeLayer];  //将主图层添加到视图图层上去并显示出来
}


- (void)yyi_draw2 {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(45, 45), YES, 2);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 16.72, 7.22);
    CGContextAddLineToPoint(ctx, 3.29, 20.83);
    
    
    CGContextStrokePath(ctx);
    UIGraphicsEndImageContext();
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
