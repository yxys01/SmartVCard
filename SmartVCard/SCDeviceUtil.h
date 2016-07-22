//
//  SCDeviceUtil.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/14.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SCDeviceUtil : NSObject

/**
 判断照相机是否可用
 */
+ (BOOL)isCameraAvailable;
/**
 照相机是否可以拍照
 */
+ (BOOL) doesCameraSupportTakingPhotos;
/**
 判断图库是否有效
 */
+ (BOOL)isPhotoLibraryAvailable;
/**
 判断后摄像头是否有效
 */
+ (BOOL)isRearCameraAvailable;
/**
 判断前摄像头是否有效
 */
+ (BOOL)isFrontCameraAvailable;

@end
