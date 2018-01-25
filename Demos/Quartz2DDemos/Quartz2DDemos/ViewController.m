//
//  ViewController.m
//  Quartz2DDemos
//
//  Created by More on 2018/1/24.
//  Copyright © 2018年 More. All rights reserved.
//

#import "ViewController.h"
#import "CutViewController.h"
#import "PictureViewController.h"
#import "EraseViewController.h"
#import "GuestViewController.h"
#import "DrawingViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tab;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    [self setUI];

}

-(void)setUI{
    
    [self.tab registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tab.delegate =self;
    self.tab.dataSource = self;
}

-( NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            CutViewController*vc =[[CutViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if(indexPath.row ==1){
            
            PictureViewController*vc =[[PictureViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row ==2){
            EraseViewController *vc =[[EraseViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else{
        if (indexPath.row==0) {
            
            GuestViewController*vc =[[GuestViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];

        }else if (indexPath.row==1){
            
            DrawingViewController*vc =[[DrawingViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];

        }
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
