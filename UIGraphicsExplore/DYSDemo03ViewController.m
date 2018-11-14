//
//  DYSDemo03ViewController.m
//  UIGraphicsExplore
//
//  Created by 丁玉松 on 2018/11/14.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "DYSDemo03ViewController.h"

@interface DYSDemo03ViewController ()

@end

@implementation DYSDemo03ViewController

-(void)dealloc {
    NSLog(@"%@释放了",NSStringFromClass([self class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImage *image = [UIImage imageNamed:@"banner1.png"];
    unsigned char *imageBytes = [self pixelBRGABytesFromImage:image];
    
    CGSize imageSize = CGSizeMake(100, 100);
    
    UIImage *image2 = [self imageFromBRGABytes:imageBytes imageSize:imageSize];
    NSLog(@"image = %@",image2);
    
    UIImageView *imaView = [[UIImageView alloc] initWithImage:image];
    imaView.frame = CGRectMake(0, 0, 200, 200);
    imaView.center = self.view.center;
    imaView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imaView];

    //注：不要忘记释放malloc的内存
    free(imageBytes);

    // Do any additional setup after loading the view.
}
- (unsigned char *)pixelBRGABytesFromImage:(UIImage *)image {
    return [self pixelBRGABytesFromImageRef:image.CGImage];
}

- (unsigned char *)pixelBRGABytesFromImageRef:(CGImageRef)imageRef {
    
    NSUInteger iWidth = CGImageGetWidth(imageRef);
    NSUInteger iHeight = CGImageGetHeight(imageRef);
    NSUInteger iBytesPerPixel = 4;
    NSUInteger iBytesPerRow = iBytesPerPixel * iWidth;
    NSUInteger iBitsPerComponent = 8;
    unsigned char *imageBytes = malloc(iWidth * iHeight * iBytesPerPixel);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(imageBytes,
                                                 iWidth,
                                                 iHeight,
                                                 iBitsPerComponent,
                                                 iBytesPerRow,
                                                 colorspace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    
    CGRect rect = CGRectMake(0 , 0 , iWidth , iHeight);
    CGContextDrawImage(context , rect ,imageRef);
    CGColorSpaceRelease(colorspace);
    CGContextRelease(context);
    CGImageRelease(imageRef);
    
    return imageBytes;
}


- (UIImage *)imageFromBRGABytes:(unsigned char *)imageBytes imageSize:(CGSize)imageSize {
    CGImageRef imageRef = [self imageRefFromBGRABytes:imageBytes imageSize:imageSize];
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return image;
}

- (CGImageRef)imageRefFromBGRABytes:(unsigned char *)imageBytes imageSize:(CGSize)imageSize {
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(imageBytes,
                                                 imageSize.width,
                                                 imageSize.height,
                                                 8,
                                                 imageSize.width * 4,
                                                 colorSpace,
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    return imageRef;
}



@end
