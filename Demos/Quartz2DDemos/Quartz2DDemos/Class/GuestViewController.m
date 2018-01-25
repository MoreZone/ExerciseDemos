//
//  GuestViewController.m
//  Quartz2DDemos
//
//  Created by More on 2018/1/25.
//  Copyright © 2018年 More. All rights reserved.
//

#import "GuestViewController.h"
#import "VCView.h"

@interface GuestViewController ()

@property(nonatomic,strong)VCView*vcView;

@end

@implementation GuestViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setUI];
}

-(void)setUI{
    
    _vcView = [[VCView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    
    UIColor *bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Home_refresh_bg"]];
    _vcView.backgroundColor =bgColor;
                        
    [self.view addSubview:_vcView];
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
