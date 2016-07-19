//
//  nkHomeTabBar.m
//  nkShooping
//
//  Created by 仇凯 on 16/7/12.
//  Copyright © 2016年 仇凯. All rights reserved.
//

#import "nkHomeTabBar.h"
#import "nkMapViewController.h"


@interface nkHomeTabBar()

/** add*/
@property(nonatomic,strong) UIButton *addButton;


@end


@implementation nkHomeTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIButton *add = [[UIButton alloc]init];
        [add setBackgroundImage:[UIImage imageNamed:@"mapLog"] forState:UIControlStateNormal];
        [add setBackgroundImage:[UIImage imageNamed:@"mapLog"] forState:UIControlStateHighlighted];
        add.tag = 0;
        [add addTarget:self action:@selector(mapClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:add];
        self.addButton = add;
    }
    return self;
}

- (void)mapClick{
    nkMapViewController *publish = [[nkMapViewController alloc]init];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:publish animated:YES completion:nil];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.addButton.bounds = CGRectMake(0, 0, self.addButton.currentBackgroundImage.size.width, self.addButton.currentBackgroundImage.size.height);
    self.addButton.center = CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5);
    NSInteger i = 0;
    CGFloat with = (self.width - self.addButton.width)/4;
    CGFloat heigh = self.height;
    for (UIView *aa in self.subviews) {
        if ([aa isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            CGFloat x = i<2?(0+i*with):(self.bounds.size.width-(4-i)*with);
            aa.frame = CGRectMake(x, 0, with, heigh);
            i++;
        }
    }

}

@end
