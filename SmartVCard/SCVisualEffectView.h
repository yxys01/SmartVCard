//
//  SCVisualEffectView.h
//  SmartVCard
//
//  Created by 夏天 on 16/7/11.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCVisualEffectButton;

typedef void(^clickNoteBlock) (SCVisualEffectButton *btn);//日记
typedef void(^clicklifeBlock) (SCVisualEffectButton *btn);//生活圈
typedef void(^clickPicBlock ) (SCVisualEffectButton *btn);//照片墙

typedef void(^didHideBlock)();
typedef void(^didShowBlock)();

@interface SCVisualEffectView : UIView

@property (nonatomic, strong) clickNoteBlock clickNoteBlock;
@property (nonatomic, strong) clicklifeBlock clicklifeBlock;
@property (nonatomic, strong) clickPicBlock  clickPicBlock;

@property (nonatomic, assign) didHideBlock didHideBlock;
@property (nonatomic, assign) didShowBlock didShowBlock;

- (void)selectedNote:(clickNoteBlock)block;
- (void)selectedlife:(clicklifeBlock)block;
- (void)selectedPic :(clickPicBlock )block;

- (void)show:(didShowBlock)block;
- (void)hide:(didHideBlock)block;

@end
