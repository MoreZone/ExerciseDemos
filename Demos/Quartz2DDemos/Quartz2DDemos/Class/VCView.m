//
//  VCView.m
//  Quartz2DDemos
//
//  Created by More on 2018/1/25.
//  Copyright © 2018年 More. All rights reserved.
//

#import "VCView.h"

@interface VCView()

@property(nonatomic,strong)NSMutableArray*selectBtn;

/**
 当手指移动的点
 */
@property(nonatomic,assign)CGPoint curP;

@end

@implementation VCView

-(NSMutableArray*)selectBtn{
    if (_selectBtn ==nil) {
        _selectBtn = [NSMutableArray array];
    }
    return _selectBtn;
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self setUI];
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        [self setUI];
    }
    return self;
}
// 超级马里奥奥德赛  马里奥赛车  荒野之息
-(void)drawRect:(CGRect)rect{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i =0; i<self.selectBtn.count; i++) {
        UIButton*btn = self.selectBtn[i];
        if (i==0) {
            [path moveToPoint:btn.center];
        }else{
            [path addLineToPoint:btn.center];
        }
    }
    [[UIColor redColor]set];
    [path setLineWidth:10];
    // 设置链接样式
    [path setLineJoinStyle:kCGLineJoinRound];
    [path stroke];
}

/**
 初始化
 */
-(void)setUI{
    
    for (int i=0; i<9; i++) {
        
        UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.userInteractionEnabled = NO;
        
        btn.tag = i;
        
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        [self addSubview:btn];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    //总列数
    int cloumn = 3;
    CGFloat btnWH = 74;
    //每列之间的间距
    CGFloat margin = (self.bounds.size.width - cloumn * btnWH) / (cloumn + 1);
    //当前所在的列
    int curClounm = 0;
    //当前所在的行
    int curRow = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    //取出所有的控件
    for (int i = 0; i < self.subviews.count; i++) {
        //计算当前所在的列
        curClounm = i % cloumn;
        //计算当前所在的行.
        curRow = i / cloumn;
        //计算Y
        x = margin + (margin + btnWH) * curClounm;
        //计算Y.
        y = (margin +btnWH) * curRow;
        UIButton *btn = self.subviews[i];
        
        NSLog(@"%@",btn);
        btn.frame = CGRectMake(x, y, btnWH, btnWH);
    }
}

-(CGPoint)getCurrentPoint:(NSSet*)touches{
 
    UITouch * touch = [touches anyObject];
    return  [touch locationInView:self];
}
//判断当前在不在按钮上面
-(UIButton*)btnRectContainsPoint:(CGPoint)point{
    for (UIButton*btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, point)) {
            return btn;
        }
    }
    return nil;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 获取当前手指所在的点
    CGPoint curP = [self getCurrentPoint:touches];
    
    // 判断当前手指所在的点在不在按钮上面
    UIButton *btn = [self btnRectContainsPoint:curP];
    
    if (btn&&btn.selected ==NO) {
        // 让按钮成为选中状态
        btn.selected = YES;
        // 选中的按钮天骄到数组当中
        [self.selectBtn addObject:btn];
    }
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 获取当前手指所在的点
    CGPoint curP = [self getCurrentPoint:touches];
    
    // 判断当前手指所在在不在按钮上面
    UIButton*btn = [self btnRectContainsPoint:curP];
    
    if (btn&&btn.selected ==NO) {
        
        btn.selected =YES;
        
        [self.selectBtn addObject:btn];
        
    }
    //每次添加完毕之后重新绘制
    [self setNeedsDisplay];
    
    self.curP = curP;
}
// 手指松开 按钮取消选中状态
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.selectBtn.count) {
        
        NSMutableString*str = [NSMutableString string];
        for (UIButton*btn in self.selectBtn) {
            [str appendFormat:@"%ld",btn.tag];
            btn.selected = NO;
        }
        
        [self.selectBtn removeAllObjects];
        
        [self setNeedsDisplay];
        
        // 查看是否是上次设置的密码
        NSString*keyPwd = [[NSUserDefaults standardUserDefaults]objectForKey:@"keyPwd"];
        if (!keyPwd) {
            
            [[NSUserDefaults standardUserDefaults]setObject:str forKey:@"keyPwd"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
        }else{
            if ([keyPwd isEqualToString:str]) {
                if ([keyPwd isEqualToString:str]) {
                    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"手势输入正确" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [alertV show];
                }else{
                    NSLog(@"密码错误");
                    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"手势输入错误" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [alertV show];
                }
            }
            NSLog(@"选中按钮顺序为:%@",str);
        }
    }
    
}


@end
