//
//  nkFirstViewController.m
//  nkShooping
//
//  Created by 仇凯 on 16/7/12.
//  Copyright © 2016年 仇凯. All rights reserved.
//

#import "nkFirstViewController.h"
#import "nkFirstView.h"
#import "UIImage+Fit.h"


@interface nkFirstViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *cate;
@property (weak, nonatomic) IBOutlet UIButton *searchIcon;
@property (weak, nonatomic) IBOutlet UITextField *searchText;
@property (weak, nonatomic) IBOutlet UIButton *sao;
@property (strong, nonatomic) UIToolbar *contents;
@property (strong, nonatomic) UIView *con;
/** isPopMenu*/
@property (nonatomic, assign) BOOL isPopMenu;

/** UIVC*/
@property(nonatomic,strong) UIButton *vc;

/** ScrollView中内容显示*/
@property(nonatomic,weak) nkFirstView *first;

@end

@implementation nkFirstViewController


+ (instancetype)firstController{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (IBAction)cateClick:(id)sender {
    // 显示蒙板
    [self setupHubShow];
    [self addCateButtons];
    
}

#pragma mark -- 显示蒙板
- (void)setupHubShow{
    UIView *diceng = [[UIView alloc]initWithFrame:CGRectMake(0,-self.view.height,NKScreenW,NKScreenH)];
    self.con = diceng;
    UIToolbar *mao = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0,NKScreenW,NKScreenH)];
    UIView *dianji = [[UIView alloc]initWithFrame:mao.frame];
    dianji.backgroundColor = [UIColor whiteColor];
    dianji.alpha = 0.2;
    UIPanGestureRecognizer *rgg = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(outHub)];
    [dianji addGestureRecognizer:rgg];
    [self.con addSubview:mao];
    [self.con addSubview:dianji];
    [self.view addSubview:self.con];
    if (_isPopMenu == NO) {
        [UIView animateWithDuration:0.5 animations:^{
            self.tabBarController.tabBar.hidden = YES;
            self.con.origin = CGPointMake(0, 0);
        }];
    }
    _isPopMenu = YES;
}

#pragma mark -- 隐藏蒙板
- (void)setupHubHidden{
    if (self.con) {
        if (_isPopMenu == YES) {
            [UIView animateWithDuration:0.5 animations:^{
                self.con.origin = CGPointMake(0, -self.view.height);
                self.tabBarController.tabBar.hidden = NO;
            }];
        }
    }
    [self.con removeFromSuperview];
    _isPopMenu = NO;
}


- (void)outHub{
    [self setupHubHidden];
}

- (void)addCateButtons{
    UIButton *aa = [[UIButton alloc]initWithFrame:CGRectMake(NKScreenW/2,NKScreenH/2,100,100)];
    aa.backgroundColor = [UIColor orangeColor];
    [aa addTarget:self action:@selector(outHub) forControlEvents:UIControlEventTouchUpInside];
    [aa setTitle:@"退出" forState:UIControlStateNormal];
    [aa setTitle:@"退出中" forState:UIControlStateHighlighted];
//    self.vc = aa;
    [self.con addSubview:aa];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // 网络设置
    [self setupNet];
    // 添加内容view
    [self setIconView];
    

}


#pragma mark -- 网络设置
- (void)setupNet{
    
}

#pragma mark -- 设置内容view
- (void)setIconView{
    
    nkFirstView *dd = [nkFirstView firstView];
    dd.backgroundColor = [UIColor redColor];
    dd.frame = CGRectMake(0, 0, self.view.width ,600);
    self.scrollView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
    self.first = dd;
    [self.scrollView addSubview:dd];
    
    // 查看边界
    UIButton *ff = [UIButton buttonWithType:UIButtonTypeContactAdd];
    ff.frame = CGRectMake(0, 0, 20, 20);
    [self.scrollView addSubview:ff];
    UIButton *fgf = [UIButton buttonWithType:UIButtonTypeContactAdd];
    fgf.frame = CGRectMake(0, 400, 20, 20);
    [self.scrollView addSubview:fgf];
    UIButton *ffd = [UIButton buttonWithType:UIButtonTypeContactAdd];
    ffd.frame = CGRectMake(0, 780, 20, 20);
    [self.scrollView addSubview:ffd];
}

- (void)viewDidLayoutSubviews{
    self.first.frame = CGRectMake(0, 0, self.view.width ,800);
    self.scrollView.contentSize = CGSizeMake(self.view.width, self.view.height+48);
}

- (void)viewDidAppear:(BOOL)animated{
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];

}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
