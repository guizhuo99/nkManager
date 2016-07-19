//
//  nkMapViewController.m
//  nkShooping
//
//  Created by 仇凯 on 16/7/13.
//  Copyright © 2016年 仇凯. All rights reserved.
//

#import "nkMapViewController.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "UIImage+Fit.h"
#import "nkWGS84TOGCJ02.h"


// 高德地图框架头文件
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>


@interface nkMapViewController () <CLLocationManagerDelegate,MAMapViewDelegate,MAMapViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIView *navView;
@property (weak, nonatomic) IBOutlet UIButton *outBut;


@property (readonly, nonatomic, retain) CLLocation *nkUserlocation;
/** MAMapView */
@property(nonatomic,strong) IBOutlet MAMapView *mapView;
/** 是否允许调用用户当前坐标showsUserLocation */
@property(nonatomic,assign) BOOL showsUserLocation;
/** clmanager */
@property(nonatomic,strong) CLLocationManager *clmanager;

@end

@implementation nkMapViewController

#pragma mark -- 懒加载
// 懒加载，顺带适配，设置代理
- (CLLocationManager*)lm{
    if (!_clmanager) {
        _clmanager = [[CLLocationManager alloc]init];
        _clmanager.desiredAccuracy = kCLLocationAccuracyBest;
        _clmanager.delegate = self;
        _clmanager.distanceFilter = YES;
        
        // 适配ios版本，同时在info.plist和capabilities中改设置
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            if ([_clmanager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                [_clmanager requestAlwaysAuthorization];
            }
        }
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
            _clmanager.allowsBackgroundLocationUpdates = YES;
        }
    }
    return _clmanager;
}


// 设置地图key
- (void)configureAPIKey
{
    [AMapServices sharedServices].apiKey = NKMapKey;
}
// 返回上个界面
- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        self.tabBarController.tabBar.hidden = NO;
    }];
}

// 搜索周围
- (IBAction)seaZW:(id)sender {
    
}

// 搜索特定区域
- (IBAction)seaTD:(id)sender {
    [self.view endEditing:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置地图key
    [self configureAPIKey];
    // 地图设置
    [self setupMap];
    
    
}

#pragma mark -- 地图设置
- (void)setupMap{
    self.mapView.delegate = self;
    // 是否显示比例尺，默认为YES
    self.mapView.showsScale = YES;
    // 是否显示罗盘，默认为YES
    self.mapView.showsCompass = YES;
    
    self.mapView.pausesLocationUpdatesAutomatically = NO;
    self.mapView.allowsBackgroundLocationUpdates = YES;//iOS9以上系统必须配置
    // 允许定位
    self.mapView.showsUserLocation = YES;
    // 设置地图用户类型：跟踪用户（定位用户）
    [self.mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
}

/**
 *  设置罗盘的图像
 *
 *  @param image 当设置图像非空时，指南针将呈现该图像，如果为nil时，则恢复默认。
 *   - (void)setCompassImage:(UIImage *)image;
 */
#pragma mark - MAMapViewDelegate
//
// 改变跟踪模式时调用
//- (void)mapView:(MAMapView *)mapView didChangeUserTrackingMode:(MAUserTrackingMode)mode animated:(BOOL)animated
//{
//    
//}

// 更新用户坐标时调用
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation{
    if(updatingLocation)
    //取出当前位置的坐标
    NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    //得到newLocation
    CLLocation *loc = [locations objectAtIndex:0];
    //判断是不是属于国内范围
    if (![nkWGS84TOGCJ02 isLocationOutOfChina:[loc coordinate]]) {
        //转换后的coord
        CLLocationCoordinate2D coord = [nkWGS84TOGCJ02 transformFromWGSToGCJ:[loc coordinate]];
    }
    NkLogFunc;
}
    
- (void)viewWillAppear:(BOOL)animated{
    if([self.clmanager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.clmanager requestAlwaysAuthorization]; // 永久授权
        [self.clmanager requestWhenInUseAuthorization]; //使用中授权
    }
    [self.clmanager startUpdatingLocation];
    self.outBut.layer.cornerRadius = 15.0;
    self.navView.layer.cornerRadius = 22.0;
}

- (void)viewDidAppear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:NO];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
