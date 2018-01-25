//
//  DrawView.m
//  Quartz2DDemos
//
//  Created by More on 2018/1/25.
//  Copyright © 2018年 More. All rights reserved.
//

#import "DrawView.h"

@interface DrawView()

//  保存所有路径数组
@property(nonatomic,strong)NSMutableArray*pathArray;

// 绘制当前的路径
@property(nonatomic,strong)UIBezierPath*path;


@end

@implementation DrawView

-(NSMutableArray*)pathArray{
    
    if (_pathArray == nil) {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}
-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    UIPanGestureRecognizer*pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self addGestureRecognizer:pan];
    
}

-(void)pan:(UIPanGestureRecognizer*)pan{
    
    CGPoint curP = [pan locationInView:self];
    
    if (pan.state ==UIGestureRecognizerStateBegan) {
        
        UIBezierPath*path =[UIBezierPath bezierPath];
        
        [path moveToPoint:curP];
        
        self.path = path;
        
        [self.pathArray addObject:path];
        
    }else if (pan.state ==UIGestureRecognizerStateChanged){
        
        [self.path addLineToPoint:curP];
        
        [self setNeedsDisplay];
    }
    
}



-(void)drawRect:(CGRect)rect{
    
    for (UIBezierPath*path in self.pathArray) {
        
        [path stroke];
    }
    
}


@end
