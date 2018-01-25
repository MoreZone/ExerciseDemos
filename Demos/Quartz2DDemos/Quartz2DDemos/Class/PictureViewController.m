//
//  PictureViewController.m
//  Quartz2DDemos
//
//  Created by More on 2018/1/24.
//  Copyright © 2018年 More. All rights reserved.
//

#import "PictureViewController.h"

@interface PictureViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
- (IBAction)pan:(id)sender;

@property(nonatomic,assign)CGPoint startP;
@property(nonatomic,weak)UIView *coverView;


@end

@implementation PictureViewController
-(UIView*)coverView{
    if (_coverView==nil) {
        UIView*cover = [[UIView alloc]init];
        cover.backgroundColor = [UIColor blackColor];
        cover.alpha = 0.7;
        [self.view addSubview:cover];
        _coverView = cover;
    }
    return _coverView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.userInteractionEnabled = YES;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



- (IBAction)pan:(UIPanGestureRecognizer*)pan {
    
    CGPoint curP =[pan locationInView:self.bgImageView];
    if (pan.state == UIGestureRecognizerStateBegan) {
        CGPoint startP = curP;
        self.startP  =startP;
    }else if(pan.state ==UIGestureRecognizerStateChanged){
        
        CGFloat offsetX = curP.x -self.startP.x;
        CGFloat offsetY = curP.y -self.startP.y;
        CGRect  rect = CGRectMake(self.startP.x, self.startP.y, offsetX, offsetY);
        self.coverView.frame = rect;
    }else if (pan.state == UIGestureRecognizerStateEnded){
        
    UIGraphicsBeginImageContextWithOptions(self.bgImageView.bounds.size, NO, 0);
        
        UIBezierPath*path = [UIBezierPath bezierPathWithRect:self.coverView.frame];
        [path addClip];
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [self.bgImageView.layer renderInContext:ctx];
        
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        self.bgImageView.image = newImage;
        
        [self.coverView removeFromSuperview];

        
    }
    
}

@end

