//
//  ViewController.m
//  NavigationTestDemo
//
//  Created by fei on 14-10-11.
//  Copyright (c) 2014年 self. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [self setNavigationItems];
    
    
    
}

-(void)setNavigationItems {
    self.title = @"首页";
    
    
    
    /* 添加左侧导航按钮 */
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleBordered target:self action:@selector(leftBarButtonClicked:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    
    /* 设置返回按钮样式 对应下一级视图 */
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem.tintColor = [UIColor blackColor];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"segue");
    /* 当修改leftBarButtonItem 之后，右滑返回的手势不响应的解决方法 */
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

-(void)leftBarButtonClicked:(UIButton *)button {
    NSLog(@"left button clicked");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
