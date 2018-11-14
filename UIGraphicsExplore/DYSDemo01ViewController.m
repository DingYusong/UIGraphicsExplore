//
//  DYSDemo01ViewController.m
//  UIGraphicsExplore
//
//  Created by 丁玉松 on 2018/11/13.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo01ViewController.h"
#import "DYSDemo1View.h"
#import "DYSDemo01Layer.h"

@interface DYSDemo01ViewController ()

@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation DYSDemo01ViewController
/*
 0.创建上下文 context
 有两种情况1.复写drawrect方法，系统会自动为你生成的图形上下文。当你子类化了一个UIView并实现了自己的drawRect：方法后，一旦drawRect：方法被调用，Cocoa就会为你创建一个图形上下文，此时你对图形上下文的所有绘图操作都会显示在UIView上。直接可以用 UIGraphicsGetCurrentContext(); 获取上下文。
 
 2.第二种方法就是创建一个图片类型的上下文。调用UIGraphicsBeginImageContextWithOptions函数就可获得用来处理图片的图形上下文。利用该上下文，你就可以在其上进行绘图，并生成图片。调用UIGraphicsGetImageFromCurrentImageContext函数可从当前上下文中获取一个UIImage对象。记住在你所有的绘图操作后别忘了调用UIGraphicsEndImageContext函数关闭图形上下文。
 
 
 
 这个绘制到哪儿去了？这正好引出所谓的 CGContext 登场。我们传过去的ctx参数正是在那个上下文中。而这个上下文定义了我们需要绘制的地方。如果我们实现了 CALayer 的 -drawInContext: 这时已经传过来一个上下文。绘制到这个上下文中的内容将会被绘制到图层的备份区(图层的缓冲区).但是我们也可以创建我们自己的上下文，叫做基于位图的上下文，比如 CGBitmapContextCreate().这个方法返回一个我们可以传给 CGContext 方法来绘制的上下文。
 
 注意 UIKit 版本的代码为何不传入一个上下文参数到方法中？这是因为当使用 UIKit 或者 AppKit 时，上下文是唯一的。UIkit 维护着一个上下文堆栈，UIKit 方法总是绘制到最顶层的上下文中。你可以使用 UIGraphicsGetCurrentContext() 来得到最顶层的上下文。你可以使用 UIGraphicsPushContext() 和 UIGraphicsPopContext() 在 UIKit 的堆栈中推进或取出上下文。
 
 最为突出的是，UIKit 使用 UIGraphicsBeginImageContextWithOptions() 和 UIGraphicsEndImageContext() 方便的创建类似于 CGBitmapContextCreate() 的位图上下文。混合调用 UIKit 和 Core Graphics 非常简单：
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [self yyi_addCustomView];

//    [self yyi_drawOctagon];
    
//    [self yyi_addCustomView2];
    
//    [self yyi_addCustomView3];
    
    
    [self yyi_draw5];
}
- (void)yyi_addCustomView {
    DYSDemo1View *view = [DYSDemo1View new];
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(0, 0, 400, 400);
    view.center = self.view.center;
    [self.view addSubview:view];
    
    //[view setNeedsDisplay];
    //[view setNeedsDisplayInRect:CGRectMake(0, 0, 100, 100)];
    //会调用drawRect方法
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



- (void)yyi_draw4 {
    
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
}

- (void)yyi_draw1 {
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



- (void)yyi_draw3 {
        CGPoint layerCenter = CGPointMake(CGRectGetWidth(self.view.frame)/2, CGRectGetWidth(self.view.frame)/2);
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = self.view.bounds;
        layer.lineWidth = 6.0;
        layer.strokeColor = [UIColor redColor].CGColor;
        layer.fillColor = [UIColor blueColor].CGColor;
    
        self.path = [UIBezierPath bezierPath];
        [self.path addArcWithCenter:layerCenter radius:50 startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
        layer.path = self.path.CGPath;
    
        UIGraphicsBeginImageContext(self.view.bounds.size);
        [self.path stroke];
        [self.path fill];
        UIGraphicsEndImageContext();
    
        [self.view.layer addSublayer:layer];
}


- (void)yyi_draw5 {
    
    DYSDemo01Layer *layer = [DYSDemo01Layer new];
    layer.frame = CGRectMake(0, 100, 100, 100);
    [self.view.layer addSublayer:layer];
    [layer setNeedsDisplay];
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
