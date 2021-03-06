//
//  UIImage+image.m
//  01-带有边框的圆形图片裁剪
//
//  Created by Gavin on 15/9/21.
//  Copyright (c) 2015年 Gavin. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)


+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image{
    
    //1.开启一个和原始图片一样大小的位图上下文.
    CGSize size = CGSizeMake(image.size.width + 2 *borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size,NO,0);
    //2.绘制一个大圆,填充
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [[UIColor blueColor] set];
    [path fill];
    //3.添加一个裁剪区域.
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [path addClip];
    //4.把图片绘制到裁剪区域当中.
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    //5.生成一张新图片.
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    //6.关闭上下文.
    UIGraphicsEndImageContext();
    
    return clipImage;
    
}


@end
