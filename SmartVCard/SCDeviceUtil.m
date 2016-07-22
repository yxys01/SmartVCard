//
//  SCDeviceUtil.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/14.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCDeviceUtil.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation SCDeviceUtil

//判断相机是否可用
+ (BOOL)isCameraAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
//(__bridge NSString *)kUTTypeImage不太懂这里的用法；传入一个block还是?
+ (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}
/**
 *  返回媒体是否支持照相机
 *availableMediaTypesForSourceType:
 UIImagePickerControllerSourceTypePhotoLibrary,(相册)
 UIImagePickerControllerSourceTypeCamera,(照相机)
 UIImagePickerControllerSourceTypeSavedPhotosAlbum(照片库)
 
 */
+ (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType
{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;//同break
        }
    }];
    
    return result;
}

+ (BOOL)isPhotoLibraryAvailable {
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}

+ (BOOL)isRearCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

+ (BOOL)isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}


@end
