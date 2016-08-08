//
//  SCMyCardDesignViewLayout.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/27.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HJCarouselAnim) {
    HJCarouselAnimLinear,
    HJCarouselAnimRotary,
    HJCarouselAnimCarousel,
    HJCarouselAnimCarousel1,
    HJCarouselAnimCoverFlow,
};

@interface SCMyCardDesignViewLayout : UICollectionViewLayout

- (instancetype)initWithAnim:(HJCarouselAnim)anim;

@property (nonatomic)HJCarouselAnim carouselAnim;
@property(nonatomic)CGSize itemSize;
@property(nonatomic)NSInteger visibleCount;
@property(nonatomic)UICollectionViewScrollDirection scrollDirection;
@end
