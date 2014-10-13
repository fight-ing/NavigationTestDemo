//
//  SecondViewController.m
//  NavigationTestDemo
//
//  Created by fei on 14-10-11.
//  Copyright (c) 2014年 self. All rights reserved.
//

#import "SecondViewController.h"
#import "ShortCutView.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    /* 当修改leftBarButtonItem 之后，右滑返回的手势不响应的解决方法 */
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationItems];
}

-(void)setNavigationItems {
    self.title = @"第二页";
    
    /* 设置返回按钮样式 对应下一级视图 */
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    self.navigationItem.backBarButtonItem.tintColor = [UIColor redColor];
    
    
    /* 添加左侧导航按钮  >>>>> 右滑返回失效*/
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"aaa" style:UIBarButtonItemStyleBordered target:self action:@selector(leftButtonClicked:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"control_07"] style:UIBarButtonItemStyleBordered target:self action:@selector(leftButtonClicked:)];
//    [self.navigationItem.leftBarButtonItem setTitlePositionAdjustment:UIOffsetMake(-10, 0) forBarMetrics:UIBarMetricsDefault];
    /* 调整leftBarButtonitem 图片位置 */
    [self.navigationItem.leftBarButtonItem setImageInsets:UIEdgeInsetsMake(4, -8, 0, 0)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    
    
    /* 添加右侧导航按钮 */
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"menu" style:UIBarButtonItemStyleBordered target:self action:@selector(rightButtonClicked:)];
    
}


-(void)rightButtonClicked:(UIButton *)button {
    ShortCutView *sView = [[ShortCutView alloc] initWithFrame:CGRectZero andSuperVC:self];
    [sView showView];
}

-(void)leftButtonClicked:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
