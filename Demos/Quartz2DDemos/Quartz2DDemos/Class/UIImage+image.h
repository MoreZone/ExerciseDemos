//
//  UIImage+image.h
//  01-带有边框的圆形图片裁剪
//
//  Created by Gavin on 15/9/21.
//  Copyright (c) 2015年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)
//根据传入的图片,生成一终带有边框的圆形图片.
//borderW边框宽度
//borderColor:边框颜色
//image:要生成的原始图片.
+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image;
@end
