//
//  nkWGS84TOGCJ02.h
//  nkShooping
//
//  Created by 仇凯 on 16/7/18.
//  Copyright © 2016年 仇凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface nkWGS84TOGCJ02 : NSObject

//判断是否已经超出中国范围
+(BOOL)isLocationOutOfChina:(CLLocationCoordinate2D)location;
//转GCJ-02
+(CLLocationCoordinate2D)transformFromWGSToGCJ:(CLLocationCoordinate2D)wgsLoc;
@end
