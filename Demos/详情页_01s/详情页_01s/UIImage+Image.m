//
//  UIImage+Image.m
//  详情页_01s
//
//  Created by More on 2018/1/23.
//  Copyright © 2018年 More. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+(UIImage*)imageWithColor:(UIColor*)color{
    
    CGRect rect  =CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
    
    
    
    
    
    
    
    
    
    
    
    
    
}

@end
