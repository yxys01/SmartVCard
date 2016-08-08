//
//  UIImage+SCRoundRectImage.h
//  SmartVCard
//
//  Created by 夏天 on 16/8/2.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SCRoundRectImage)
/*!
 * @function imageOfRoundRectWithImage: radius:
 *
 * @abstract
 * Create a round rect on provided image.
 *
 * @discussion
 * Create a round rect on provided image, however
 * return nil if image is nil.
 *
 * @param image
 * The target image we will create round rect on it.
 *
 *  @param size
 * The target param device image size
 *
 *  @param radius
 * Offer a CGFloat-type value to device radius on round rect.
 * The param must between 5.0 and 10.0.
 */
+ (UIImage *)imageOfRoundRectWithImage: (UIImage *)image
                                  size: (CGSize)size
                                radius: (CGFloat)radius;
@end
