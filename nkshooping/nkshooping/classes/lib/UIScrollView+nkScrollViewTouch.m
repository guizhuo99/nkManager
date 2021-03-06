//
//  UIScrollView+nkScrollViewTouch.m
//  nkShooping
//
//  Created by 仇凯 on 16/7/12.
//  Copyright © 2016年 仇凯. All rights reserved.
//

#import "UIScrollView+nkScrollViewTouch.h"

@implementation UIScrollView (nkScrollViewTouch)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}
@end
