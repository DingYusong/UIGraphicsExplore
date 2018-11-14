//
//  DYSDemo1View.m
//  UIGraphicsExplore
//
//  Created by 丁玉松 on 2018/11/13.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo1View.h"

@implementation DYSDemo1View


/**
 With –drawRect:
 如果你的视图类实现了 -drawRect:，他们将像这样工作:
 
 当你调用 -setNeedsDisplay，UIKit 将会在这个视图的图层上调用 -setNeedsDisplay。这为图层设置了一个标识，标记为 dirty(直译是脏的意思，想不出用什么词比较贴切,污染？)，但还显示原来的内容。它实际上没做任何工作，所以多次调用 -setNeedsDisplay并不会造成性能损失。
 
 下面，当渲染系统准备好，它会调用视图图层的-display方法.此时，图层会装配它的后备存储。然后建立一个 Core Graphics 上下文(CGContextRef)，将后备存储对应内存中的数据恢复出来，绘图会进入对应的内存区域，并使用 CGContextRef 绘制。
 
 当你使用 UIKit 的绘制方法，例如: UIRectFill() 或者 -[UIBezierPath fill] 代替你的 -drawRect: 方法，他们将会使用这个上下文。使用方法是，UIKit 将后备存储的 CGContextRef 推进他的 graphics context stack，也就是说，它会将那个上下文设置为当前的。因此 UIGraphicsGetCurrent() 将会返回那个对应的上下文。既然 UIKit 使用 UIGraphicsGetCurrent() 绘制方法，绘图将会进入到图层的后备存储。如果你想直接使用 Core Graphics 方法，你可以自己调用 UIGraphicsGetCurrent() 得到相同的上下文，并且将这个上下文传给 Core Graphics 方法。
 
 从现在开始，图层的后备存储将会被不断的渲染到屏幕上。直到下次再次调用视图的 -setNeedsDisplay ，将会依次将图层的后备存储更新到视图上。
 */

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //  复写这个方法后不用自己创建上下文。
    
    //  使用 UIKit 的绘制方法 自动使用当前CGContextRef
    //    [self yyi_draw1];
    //    [self yyi_draw2];
    //    [self yyi_draw3];
    
    //  使用Core Graphics方法绘制，使用UIGraphicsGetCurrentContext() 来获得绘画context
        [self yyi_draw4];
}

- (void)yyi_draw1 {
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

- (void)yyi_draw2 {
    [[UIColor redColor] setFill];
    UIRectFill([self bounds]);
}
- (void)yyi_draw3 {
    CGAffineTransform transform = CGAffineTransformMakeTranslation((self.bounds.size.width-50*5)/2, 100);
    transform = CGAffineTransformScale(transform, 5, 5);
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 50, 50) cornerRadius:10];
    [path1 applyTransform:transform];
    [[UIColor colorWithRed:198/255.0f green:198/255.0f blue:198/255.0f alpha:1.0f] setStroke];
    [path1 stroke];
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
    [path2 applyTransform:transform];
    [[UIColor colorWithRed:224/255.0f green:224/255.0f blue:224/255.0f alpha:1.0f] setFill];
    [path2 fill];
    
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRect:CGRectMake(7, 10, 14, 12)];
    [path3 applyTransform:transform];
    [[UIColor colorWithRed:189/255.0f green:189/255.0f blue:189/255.0f alpha:1.0f] setStroke];
    [path3 stroke];
    
    UIBezierPath *path11 = [UIBezierPath bezierPath];
    [path11 moveToPoint:CGPointMake(28, 10)];
    [path11 addLineToPoint:CGPointMake(43, 10)];
    [path11 applyTransform:transform];
    [[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f] setStroke];
    [path11 stroke];
    
    UIBezierPath *path12 = [UIBezierPath bezierPath];
    [path12 moveToPoint:CGPointMake(28, 16)];
    [path12 addLineToPoint:CGPointMake(43, 16)];
    [path12 applyTransform:transform];
    [path12 stroke];
    
    UIBezierPath *path13 = [UIBezierPath bezierPath];
    [path13 moveToPoint:CGPointMake(28, 22)];
    [path13 addLineToPoint:CGPointMake(43, 22)];
    [path13 applyTransform:transform];
    [path13 stroke];
    
    UIBezierPath *path21 = [UIBezierPath bezierPath];
    [path21 moveToPoint:CGPointMake(7, 28)];
    [path21 addLineToPoint:CGPointMake(43, 28)];
    [path21 applyTransform:transform];
    [path21 stroke];
    
    UIBezierPath *path22 = [UIBezierPath bezierPath];
    [path22 moveToPoint:CGPointMake(7, 34)];
    [path22 addLineToPoint:CGPointMake(43, 34)];
    [path22 applyTransform:transform];
    [path22 stroke];
    
    UIBezierPath *path23 = [UIBezierPath bezierPath];
    [path23 moveToPoint:CGPointMake(7, 40)];
    [path23 addLineToPoint:CGPointMake(43, 40)];
    [path23 applyTransform:transform];
    [path23 stroke];

}

- (void)yyi_draw4 {
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
