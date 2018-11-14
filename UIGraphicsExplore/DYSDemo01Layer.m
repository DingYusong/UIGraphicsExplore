//
//  DYSDemo01Layer.m
//  UIGraphicsExplore
//
//  Created by 丁玉松 on 2018/11/14.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo01Layer.h"
#import <UIKit/UIKit.h>

@implementation DYSDemo01Layer

- (void)drawInContext:(CGContextRef)ctx {
    [self yyi_draw4WithContext:ctx];
}

- (void)yyi_draw1WithContext:(CGContextRef)ctx {
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
    path.lineWidth = 0.5;
    [[UIColor redColor] setStroke];
    [[UIColor orangeColor] setFill];
    [path stroke];
}

- (void)yyi_draw2WithContext:(CGContextRef)ctx {
    [[UIColor redColor] setFill];
    UIRectFill([self bounds]);
}

- (void)yyi_draw4WithContext:(CGContextRef)ctx {
    //1.获取画布
    CGContextRef context = ctx;
    
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
