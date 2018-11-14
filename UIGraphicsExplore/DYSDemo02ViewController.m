//
//  DYSDemo02ViewController.m
//  UIGraphicsExplore
//
//  Created by 丁玉松 on 2018/11/14.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo02ViewController.h"

@interface DYSDemo02ViewController ()

@end

@implementation DYSDemo02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
