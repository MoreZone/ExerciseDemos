//
//  ViewController.m
//  详情页_01s
//
//  Created by More on 2018/1/23.
//  Copyright © 2018年 More. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Image.h"

#define iOS11_0 [[[UIDevice currentDevice] systemVersion] doubleValue] >= 11.0

#define orige  -250
#define origeHigth  200

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>


@property(nonatomic,weak)UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUI];
    
}

-(void)setUI{
    
    if (@available(iOS 11.0, *)) {
        [self.tab setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    

    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault] ;
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
//    self.navigationController.navigationBar.hidden = YES;
    
    self.tab.delegate =self;
    self.tab.dataSource =self;
    [self.tab registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    self.tab.contentInset =UIEdgeInsetsMake(250, 0, 0, 0);
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text =@"个人详情页";
    titleLabel.textColor = [UIColor colorWithWhite:0 alpha:0];
    self.titleLabel = titleLabel;
    [titleLabel sizeToFit];
    
    self.navigationItem.titleView = titleLabel;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell*cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    CGFloat offset = scrollView.contentOffset.y - orige;
    CGFloat h = origeHigth -offset;

    
    if (h<=0) {
        h =0;
    }
    self.height.constant = h;
    
    CGFloat  alpha = offset*1/136.0;
    if (alpha>=1) {
        alpha =0.99;
    }

    UIColor *color = [UIColor colorWithWhite:1 alpha:alpha];
    UIImage *image = [UIImage imageWithColor:color];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.titleLabel.textColor = [UIColor colorWithWhite:0 alpha:alpha];

    NSLog(@"%lf",_height.constant);
}


@end
