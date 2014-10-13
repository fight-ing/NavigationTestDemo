//
//  ShortCutView.h
//  ZhenPin
//
//  Created by fei on 14-10-11.
//  Copyright (c) 2014年 zhenpin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShortCutView : UIView
{
    UIControl *_backControl;
}
@property (nonatomic,retain) UIViewController *superViewController;
-(id)initWithFrame:(CGRect)frame andSuperVC:(id)viewController;
-(void)showView;
-(void)hideView;
@end
