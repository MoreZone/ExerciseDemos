//
//  EraseViewController.m
//  Quartz2DDemos
//
//  Created by More on 2018/1/25.
//  Copyright © 2018年 More. All rights reserved.
//

#import "EraseViewController.h"

@interface EraseViewController ()

@end

@implementation EraseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageV.userInteractionEnabled = YES;
    
    UIPanGestureRecognizer *pan  =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.imageV addGestureRecognizer:pan];

}
-(void)pan:(UIPanGestureRecognizer*)pan{
    
    CGPoint curP = [pan locationInView:self.imageV];
    
    CGFloat rectWH =30;
    
    CGFloat x = curP.x -rectWH*0.5;
    CGFloat y  = curP.y-rectWH*0.5;
    
    CGRect rect  = CGRectMake(x, y, rectWH, rectWH);
    // 开启一个上下文
    UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.imageV.layer renderInContext:ctx];

    CGContextClearRect(ctx, rect);
    
    UIImage*newimage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.imageV.image =newimage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
