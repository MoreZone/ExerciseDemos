//
//  CutViewController.m
//  Quartz2DDemos
//
//  Created by More on 2018/1/24.
//  Copyright © 2018年 More. All rights reserved.
//

#import "CutViewController.h"
#import "UIImage+image.h"

@interface CutViewController ()

@end

@implementation CutViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.imagev.image = [UIImage imageWithBorderW:10 borderColor:[UIColor redColor] image:[UIImage imageNamed:@"阿狸头像"]];

}

/** 图片裁剪*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    

    //开启上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctx];
    
    
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *data =UIImageJPEGRepresentation(newImage, 1);
    [data writeToFile:@"/Users/youjutou/Desktop/clipImage.png" atomically:YES];
    
    
    
    
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];

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
