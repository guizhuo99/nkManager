//
//  nkFirstView.m
//  nkShooping
//
//  Created by 仇凯 on 16/7/12.
//  Copyright © 2016年 仇凯. All rights reserved.
//

#import "nkFirstView.h"


@interface nkFirstView ()


@end

@implementation nkFirstView

+ (instancetype)firstView{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}




@end
