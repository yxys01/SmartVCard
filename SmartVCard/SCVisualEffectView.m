//
//  SCVisualEffectView.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/11.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCVisualEffectView.h"
#import "SCBehavior.h"
#import "Common.h"
#import "SCVisualEffectButton.h"
typedef enum : NSUInteger {
    
    VisualeffectViewNone,
    VisualeffectViewNote,
    VisualeffectViewLife,
    VisualeffectViewPic
    
} VisualeffectViewType;

#define beganPoint CGPointMake(Screenwidth/2, _effectView.bounds.size.height + 50)
#define kShowOutButtonHeight ScreenHeight/5 * 2 + 50
#define kShouOutButtonTime  0.2

@interface SCVisualEffectView()<UIDynamicAnimatorDelegate,UICollisionBehaviorDelegate> {
    CGPoint _point0,_point1,_point2;
    VisualeffectViewType _VisualeffectViewType;
    UISnapBehavior *_snapLife,*_snapPic;
}

@property (nonatomic, strong) UIVisualEffectView *effectView;

@property (nonatomic, strong) UIButton *hiddeButton;

@property (nonatomic, strong) UIImageView *disMissImagaView;

@property (nonatomic, strong) NSArray *points;

@property (nonatomic, strong) SCVisualEffectButton *buttonNote;
@property (nonatomic, strong) SCVisualEffectButton *buttonNoteGravi;

@property (nonatomic, strong) SCVisualEffectButton *buttonLife;
@property (nonatomic, strong) SCVisualEffectButton *buttonLifeGravi;

@property (nonatomic, strong) SCVisualEffectButton *buttonPic;
@property (nonatomic, strong) SCVisualEffectButton *buttonPicGravi;

@property (nonatomic, strong) UIView *upView;

@property (nonatomic, strong) SCBehavior *behavior;

@property (strong, nonatomic) UIDynamicAnimator *animator;

@end


@implementation SCVisualEffectView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
        [self setUpEffectButton];
        [self show];
        self.animator.delegate = self;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
        [self setUpEffectButton];
        [self show];
        self.animator.delegate = self;
    }
    return self;
}
/**加载毛玻璃特效
 添加一个隐藏毛玻璃特效的按钮
 */
- (void)setUp {
    
    _points = [self returnBtnCentersWithBtnCount:7 fromPoint:CGPointMake(Screenwidth/2, ScreenHeight + 50) needHeight:kShowOutButtonHeight];
    NSValue *value0 = _points[2];
    NSValue *value1 = _points[3];
    NSValue *value2 = _points[4];
    
    _point0 = [value0 CGPointValue];
    _point1 = [value1 CGPointValue];
    _point2 = [value2 CGPointValue];
    
    UIVisualEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 0, Screenwidth, ScreenHeight + 50);
    _effectView = effectView;
    
    UIButton *hiddeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [hiddeButton setBackgroundColor:[UIColor whiteColor]];
    hiddeButton.frame = CGRectMake(0, ScreenHeight - 60, Screenwidth, 60);
    [hiddeButton addTarget:self action:@selector(hideClick:) forControlEvents:UIControlEventTouchUpInside];
    self.hiddeButton = hiddeButton;
    [_effectView addSubview:hiddeButton];
    
    UIImageView *disMissImagaView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"template_p"]];
    CGFloat height = disMissImagaView.image.size.height;
    CGFloat width  = disMissImagaView.image.size.width;
    disMissImagaView.frame = CGRectMake(Screenwidth/2 - width/2 , ScreenHeight - height - 10, width, height);
    _disMissImagaView = disMissImagaView;
    [_effectView addSubview:disMissImagaView];
    
}
/**加载生活圈，照片墙功能按钮*/
- (void)setUpEffectButton {
    //取234
    //note
    
    //未加入这个功能
    SCVisualEffectButton *buttonNote = [SCVisualEffectButton effectButtonWithImage:[UIImage imageNamed:@"mn_add_diary"] Title:@"日记" target:self selector:@selector(noteClick:)];
    buttonNote.bounds = CGRectMake(0, 0, buttonNote.imageView.image.size.width, buttonNote.imageView.image.size.width);
    buttonNote.center = beganPoint;
    _buttonNote = buttonNote;
    // [_effectView addSubview:buttonNote];
    
    
    
    SCVisualEffectButton *buttonLife = [SCVisualEffectButton effectButtonWithImage:[UIImage imageNamed:@"template_build-1"] Title:@"模板生成" target:self selector:@selector(lifeClick:)];
    buttonLife.bounds = buttonNote.bounds;
    //buttonLife.center = beganPoint;
    buttonLife.center = CGPointMake(beganPoint.x, beganPoint.y - 50);
    _buttonLife = buttonLife;
    [_effectView addSubview:buttonLife];
    
    //pic
    
    
    SCVisualEffectButton *buttonPic = [SCVisualEffectButton effectButtonWithImage:[UIImage imageNamed:@"custom_template"] Title:@"自定义" target:self selector:@selector(picClick:)];
    buttonPic.bounds = buttonNote.bounds;
    buttonPic.center = CGPointMake(beganPoint.x, beganPoint.y - 50);
    _buttonPic = buttonPic;
    
    [_effectView addSubview:_buttonPic];
    [self addSubview:_effectView];
    
    //向上重力
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    view.frame = CGRectMake(0, 0, Screenwidth, beganPoint.y + _point1.y - buttonNote.bounds.size.width/2 - 50);
    _upView = view;
    [_effectView addSubview:_upView];
    
}

- (void)noteClick:(SCVisualEffectButton *)button {
    if(self.clickNoteBlock){
        //self.clickNoteBlock(button);
        [self hideWithCick:VisualeffectViewNote];
    }
}

- (void)lifeClick:(SCVisualEffectButton *)button {
    if (self.clicklifeBlock) {
        //self.clicklifeBlock(button);
        [self hideWithCick:VisualeffectViewLife];
    }
}
- (void)picClick:(SCVisualEffectButton *)button {
    if (self.clickPicBlock) {
        //self.clickPicBlock(button);
        [self hideWithCick:VisualeffectViewPic];
    }
}

- (void)selectedNote:(clickNoteBlock)block {
    self.clickNoteBlock = block ;
}

- (void)selectedlife:(clicklifeBlock)block {
    self.clicklifeBlock = block;
}

- (void)selectedPic:(clickPicBlock)block {
    self.clickPicBlock = block;
}

- (void)hideClick:(UIButton *)sender {
    [self hideWithCick:VisualeffectViewNone];
}
/**功能按钮显示动画*/
- (void)show {
    
    _VisualeffectViewType = VisualeffectViewNone;
    
    CABasicAnimation *theAnimation;
    theAnimation =[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration = .15;
    theAnimation.removedOnCompletion = NO;
    theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    theAnimation.toValue = [NSNumber numberWithFloat:1.0];
    [self.layer addAnimation:theAnimation forKey:@"animateOpacity"];
    
    //图片旋转pi/4
    [UIView animateWithDuration:0.01 animations:^{
        _disMissImagaView.transform = CGAffineTransformMakeRotation(M_PI/4);
    } completion:nil];
    
    [UIView animateWithDuration:kShouOutButtonTime animations:^{
        _disMissImagaView.transform = CGAffineTransformIdentity;//还原旋转
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:kShouOutButtonTime animations:^{
            _buttonNote.transform  = CGAffineTransformMakeTranslation(_point0.x, _point0.y);
        } completion:^(BOOL finished) {
            //------
            [UIView animateWithDuration:kShouOutButtonTime animations:^{
                //_buttonLife.transform  = CGAffineTransformMakeTranslation(point0.x, point0.y);
                _buttonLife.transform  = CGAffineTransformMakeTranslation(_point0.x + 50, _point1.y);
            } completion:^(BOOL finished) {
                //-----
                [UIView animateWithDuration:kShouOutButtonTime animations:^{
                    _buttonPic.transform  = CGAffineTransformMakeTranslation(_point2.x - 50, _point1.y);
                } completion:^(BOOL finished) {
                    if (self.didShowBlock) {
                        self.didShowBlock();
                    }
                }];
            }];
        }];
        
    }];
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 atPoint:(CGPoint)p {
}
/**依次移除按钮，以动画方法关闭毛玻璃效果*/
- (void)hideWithCick:(VisualeffectViewType)VisualeffectViewType{
    _VisualeffectViewType = VisualeffectViewType;
    
    switch (VisualeffectViewType) {
        case VisualeffectViewNone:
        {
        }
            break;
        case VisualeffectViewNote:
        {
            
        }
            break;
        case VisualeffectViewLife:
        {
            [self.behavior removeItem:_buttonLife];
        }
            break;
        case VisualeffectViewPic:
        {
            [self.behavior removeItem:_buttonPic];
        }
            break;
    }
    //图片旋转pi/4
    [UIView animateWithDuration:0.3 animations:^{
        _disMissImagaView.transform = CGAffineTransformMakeRotation(M_PI/4);
    } completion:^(BOOL finished) {
        switch (_VisualeffectViewType) {
            case VisualeffectViewNone:
            {
            }
                break;
            case VisualeffectViewNote:
            {
                self.clickNoteBlock(_buttonNote);
                [self removeFromSuperview];
            }
                break;
            case VisualeffectViewLife:
            {
                self.clicklifeBlock(_buttonLife);
                [self removeFromSuperview];
            }
                break;
            case VisualeffectViewPic:
            {
                self.clickPicBlock(_buttonPic);
                [self removeFromSuperview];
            }
                break;
        }
        //透明度消失的动画
        if (_VisualeffectViewType == VisualeffectViewNone ) {
            CABasicAnimation *theAnimation;
            theAnimation =[CABasicAnimation animationWithKeyPath:@"opacity"];
            theAnimation.duration = .5;
            theAnimation.delegate = self;
            theAnimation.fromValue = [NSNumber numberWithFloat:1.0];
            theAnimation.toValue = [NSNumber numberWithFloat:0.0];
            theAnimation.removedOnCompletion = NO;
            theAnimation.fillMode = kCAFillModeForwards;//当动画结束后,layer会一直保持着动画最后的状态
            [self.layer addAnimation:theAnimation forKey:@"animateOpacity"];
        };
        
    }];
    
}

- (void)animationScaleWith:(SCVisualEffectButton *)button {
    
    CABasicAnimation *theAnimation;
    theAnimation =[CABasicAnimation animationWithKeyPath:@"position"];
    theAnimation.duration = .25;
    theAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x, self.center.y - 100)];
    theAnimation.removedOnCompletion = NO;
    theAnimation.fillMode = kCAFillModeForwards;
    [button.layer addAnimation:theAnimation forKey:nil];
    
    CABasicAnimation *theAnimation1;
    theAnimation1 =[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    theAnimation1.duration = .25;
    theAnimation1.toValue = @(10);
    theAnimation1.removedOnCompletion = NO;
    theAnimation1.fillMode = kCAFillModeForwards;
    [button.layer addAnimation:theAnimation1 forKey:nil];
    
    CABasicAnimation *theAnimation2;
    theAnimation2 =[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation2.duration = .25;
    theAnimation2.delegate = self;
    theAnimation2.toValue = @(0.3);
    theAnimation2.removedOnCompletion = NO;
    theAnimation2.fillMode = kCAFillModeForwards;
    [button.layer addAnimation:theAnimation2 forKey:nil];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self removeFromSuperview];
    
    switch (_VisualeffectViewType) {
        case VisualeffectViewNone:
        {
        }
            break;
        case VisualeffectViewNote:
        {
            self.clickNoteBlock(_buttonNote);
        }
            break;
        case VisualeffectViewLife:
        {
            self.clicklifeBlock(_buttonLife);
        }
            break;
        case VisualeffectViewPic:
        {
            self.clickPicBlock(_buttonPic);
            //[self removeFromSuperview];
        }
            break;
    }
}

- (void)animationDidStart:(CAAnimation *)anim {
}
- (void)removeFromSuperview {
    [super removeFromSuperview];
    if (self.didHideBlock) {
        self.didHideBlock();
    }
}

- (void)hide:(didHideBlock)block {
    self.didHideBlock = block;
}

- (void)show:(didShowBlock)block {
    self.didShowBlock = block;
}

- (UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:_effectView];
        [_animator addBehavior:self.behavior];
    }
    return _animator;
}
- (SCBehavior *)behavior {
    if (!_behavior) {
        _behavior = [[SCBehavior alloc] init];
    }
    return _behavior;
}
/**
 *  计算弹出点
 *  @param count  有多少个btn需要弹出
 *  @param point  弹出的初始点
 *  @param height 弹出的高度
 *  @return btn的弹出点
 */
- (NSArray *)returnBtnCentersWithBtnCount:(NSInteger)count fromPoint:(CGPoint)point needHeight:(CGFloat)height{
    NSMutableArray *points = [NSMutableArray array];
    if (count == 0) return points;
    CGFloat angle = M_PI/(count+1);
    for (int i = 0; i < count; i ++) {
        CGPoint destPoint;
        CGFloat angelTempt = angle*(i + 1);
        if (angelTempt < M_PI / 2)
        {
            CGFloat x = height*sin(angelTempt);
            CGFloat y = height*cos(angelTempt);
            destPoint= CGPointMake( - y,  - x);
            //NSLog(@"x:%f,y:%f,point:{%f,%f}",x,y,point.x,point.y);
        }
        else
        {
            CGFloat angleTempt = angelTempt - M_PI/2;
            CGFloat x = height*sin(angleTempt);
            CGFloat y = height*cos(angleTempt);
            destPoint= CGPointMake( x, - y);
        }
        [points addObject:[NSValue valueWithCGPoint:destPoint]];
        //angle = + angle;
    }
    return points;
}

@end
