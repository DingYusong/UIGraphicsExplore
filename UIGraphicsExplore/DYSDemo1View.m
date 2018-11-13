//
//  DYSDemo1View.m
//  UIGraphicsExplore
//
//  Created by 丁玉松 on 2018/11/13.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo1View.h"

@implementation DYSDemo1View


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    CGAffineTransform transform = CGAffineTransformMakeTranslation((self.bounds.size.width-50*5)/2, 100);
//    transform = CGAffineTransformScale(transform, 5, 5);
//
//    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:10];
//    [path1 applyTransform:transform];
//    [[UIColor colorWithRed:198/255.0f green:198/255.0f blue:198/255.0f alpha:1.0f] setStroke];
//    [path1 stroke];
//
//    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
//    [path2 applyTransform:transform];
//    [[UIColor colorWithRed:224/255.0f green:224/255.0f blue:224/255.0f alpha:1.0f] setFill];
//    [path2 fill];
//
//    UIBezierPath *path3 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
//    [path3 applyTransform:transform];
//    [[UIColor colorWithRed:189/255.0f green:189/255.0f blue:189/255.0f alpha:1.0f] setStroke];
//    [path3 stroke];
//
//    UIBezierPath *path11 = [UIBezierPath bezierPath];
//    [path11 moveToPoint:CGPointMake(28, 10)];
//    [path11 addLineToPoint:CGPointMake(43, 10)];
//    [path11 applyTransform:transform];
//    [[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f] setStroke];
//    [path11 stroke];
//
//    UIBezierPath *path12 = [UIBezierPath bezierPath];
//    [path12 moveToPoint:CGPointMake(28, 16)];
//    [path12 addLineToPoint:CGPointMake(43, 16)];
//    [path12 applyTransform:transform];
//    [path12 stroke];
//
//    UIBezierPath *path13 = [UIBezierPath bezierPath];
//    [path13 moveToPoint:CGPointMake(28, 22)];
//    [path13 addLineToPoint:CGPointMake(43, 22)];
//    [path13 applyTransform:transform];
//    [path13 stroke];
//
//    UIBezierPath *path21 = [UIBezierPath bezierPath];
//    [path21 moveToPoint:CGPointMake(7, 28)];
//    [path21 addLineToPoint:CGPointMake(43, 28)];
//    [path21 applyTransform:transform];
//    [path21 stroke];
//
//    UIBezierPath *path22 = [UIBezierPath bezierPath];
//    [path22 moveToPoint:CGPointMake(7, 34)];
//    [path22 addLineToPoint:CGPointMake(43, 34)];
//    [path22 applyTransform:transform];
//    [path22 stroke];
//
//    UIBezierPath *path23 = [UIBezierPath bezierPath];
//    [path23 moveToPoint:CGPointMake(7, 40)];
//    [path23 addLineToPoint:CGPointMake(43, 40)];
//    [path23 applyTransform:transform];
//    [path23 stroke];

    
    
    
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(16.72, 7.22)];
//        [path addLineToPoint:CGPointMake(3.29, 20.83)];
//        [path addLineToPoint:CGPointMake(0.4, 18.05)];
//        [path addLineToPoint:CGPointMake(18.8, -0.47)];
//        [path addLineToPoint:CGPointMake(37.21, 18.05)];
//        [path addLineToPoint:CGPointMake(34.31, 20.83)];
//        [path addLineToPoint:CGPointMake(20.88, 7.22)];
//        [path addLineToPoint:CGPointMake(20.88, 42.18)];
//        [path addLineToPoint:CGPointMake(16.72, 42.18)];
//        [path addLineToPoint:CGPointMake(16.72, 7.22)];
//        [path closePath];
//        path.lineWidth = 0.5;
//        [[UIColor redColor] setStroke];
//        [[UIColor orangeColor] setFill];
//
//        [path stroke];

    
    /*
     0.创建上下文 context
     有两种情况1.复写drawrect方法，系统会自动为你生成的图形上下文。当你子类化了一个UIView并实现了自己的drawRect：方法后，一旦drawRect：方法被调用，Cocoa就会为你创建一个图形上下文，此时你对图形上下文的所有绘图操作都会显示在UIView上。直接可以用 UIGraphicsGetCurrentContext(); 获取上下文。
     
     2.第二种方法就是创建一个图片类型的上下文。调用UIGraphicsBeginImageContextWithOptions函数就可获得用来处理图片的图形上下文。利用该上下文，你就可以在其上进行绘图，并生成图片。调用UIGraphicsGetImageFromCurrentImageContext函数可从当前上下文中获取一个UIImage对象。记住在你所有的绘图操作后别忘了调用UIGraphicsEndImageContext函数关闭图形上下文。
          
     

     */

    //1.获取画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //2.创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);
    CGPathAddLineToPoint(path, nil, 20, 100);
    
    //添加路径到画布
    CGContextAddPath(context, path);
    
    //3.设置图形上下文的状态属性
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);
    CGContextSetRGBFillColor(context, 0, 1.0, 0, 1);
    
    //4.开始绘画
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //5.释放path
    CGPathRelease(path);
    
}


@end
