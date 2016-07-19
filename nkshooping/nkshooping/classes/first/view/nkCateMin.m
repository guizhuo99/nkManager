//
//  nkCateMin.m
//  nkShooping
//
//  Created by 仇凯 on 16/7/14.
//  Copyright © 2016年 仇凯. All rights reserved.
//

#import "nkCateMin.h"
@interface nkCateMin ()

@property (strong, nonatomic) UIToolbar *contents;

@end

@implementation nkCateMin


- (void)layoutSubviews{
    [super layoutSubviews];
    self.contents.frame = self.frame;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
