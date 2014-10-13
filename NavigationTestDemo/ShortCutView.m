//
//  ShortCutView.m
//  ZhenPin
//
//  Created by fei on 14-10-11.
//  Copyright (c) 2014年 zhenpin. All rights reserved.
//

#import "ShortCutView.h"

@implementation ShortCutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andSuperVC:(id)viewController {
    self = [super initWithFrame:frame];
    if (self) {
        
        _superViewController = viewController;
        
        [self setSubViews];
    }
    return self;
}


-(void)setSubViews {
    self.frame = CGRectMake(160, 64, 160, 100);
    self.backgroundColor = [UIColor blackColor];
    _backControl = [[UIControl alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _backControl.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [_backControl addGestureRecognizer:tapGes];
    
    NSArray *titleA = [NSArray arrayWithObjects:@"首页",@"购物", nil];
    
    for (int i = 0; i < titleA.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 50*i, self.frame.size.width, 50);
        [button setTitle:[titleA objectAtIndex:i] forState:UIControlStateNormal];
        button.tag = 1000+i;
        [button addTarget:self action:@selector(itemButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
    }
    
}

-(void)itemButtonClicked:(UIButton *)button {
    NSLog(@"button clicked");
    switch (button.tag) {
        case 1000:
            [_superViewController.navigationController popViewControllerAnimated:YES];
            [self hideView];
            break;
        case 1001:
            
            [self hideView];
            break;
        default:
            break;
    }
}

-(void)showView {
    self.hidden = NO;
    self.alpha = 0;
    
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    if(!keywindow){
        keywindow = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    }
    [keywindow addSubview:_backControl];
    [keywindow addSubview:self];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished){
        
    }];
}

-(void)hideView {
    self.hidden = YES;
    [_backControl removeFromSuperview];
    [self removeFromSuperview];
}

- (void)dealloc
{
    
}
-(void)tapGesture:(UITapGestureRecognizer *)tap {
    NSLog(@"tapGes");
    [self hideView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
