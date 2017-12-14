//
//  TrackView.m
//  TrackiViews
//
//  Created by chenzhen on 2017/12/13.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//

#import "TrackView.h"
#import "TrackInfoView.h"
@interface TrackView() {
    CGFloat _touch_left,_touch_top;
    NSMutableArray *hitArrayViews;
    TrackInfoView *_infoView;
}
@property (nonatomic,strong) UILabel *touchLabel;
@property (nonatomic,strong) UIWindow *infoWindow;
@property (nonatomic,strong) UILabel *infoLabel;
@end
@implementation TrackView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.zPosition = FLT_MAX;
        hitArrayViews=[[NSMutableArray alloc] init];
        [self addSubview:self.touchLabel];
        [self.window addSubview:self.infoWindow];
    }
    return self;
}



#pragma mark - touches
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //touch view
    UITouch *touch = [touches anyObject];
    CGPoint touch_point = [touch locationInView:self];
    _touch_left = touch_point.x;
    _touch_top = touch_point.y;
    
    //_viewInfoLabel
    _infoWindow.alpha = 1;
    _infoWindow.hidden = NO;
    //获取当前视图坐标信息
    CGPoint window_point=[touch locationInView:self.window];
    UIView *focusView = [self getFocusView:self.window point:window_point];
    self.infoLabel.text = [self currentRectWithView:focusView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touch_point = [touch locationInView:self.window];
    self.frame = CGRectMake(touch_point.x - _touch_left, touch_point.y - _touch_top, self.frame.size.width, self.frame.size.height);
    
    //_infoWindow
    _infoWindow.alpha = 1;
    _infoWindow.hidden = NO;
    
    CGPoint window_point=[touch locationInView:self.window];
    UIView *focusView = [self getFocusView:self.window point:window_point];
    self.infoLabel.text = [self currentRectWithView:focusView];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //_infoWindow
    [self hiddenInfoWindow];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //_infoWindow
    [self hiddenInfoWindow];
}

#pragma mark - getter and setter
- (UILabel *)touchLabel {
    if (!_touchLabel) {
        _touchLabel = [[UILabel alloc]initWithFrame:self.bounds];
        _touchLabel.backgroundColor = [UIColor orangeColor];
        _touchLabel.font = [UIFont systemFontOfSize:12];
        _touchLabel.textAlignment = NSTextAlignmentCenter;
        _touchLabel.text = @"怼我";
    }
    return _touchLabel;
}
- (UIWindow *)infoWindow {
    if (!_infoWindow) {
        _infoWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIApplication sharedApplication].statusBarFrame.size.height+20)];
        _infoWindow.backgroundColor = [UIColor blackColor];
        _infoWindow.alpha = 0;
        _infoWindow.hidden = YES;
        _infoWindow.windowLevel = UIWindowLevelAlert;
        [_infoWindow addSubview:self.infoLabel];
        [_infoWindow addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onclickTrackInfoView)]];
    }
    return _infoWindow;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc]initWithFrame:_infoWindow.bounds];
        _infoLabel.numberOfLines = 2;
        _infoLabel.font = [UIFont systemFontOfSize:13];
        _infoLabel.textColor = [UIColor whiteColor];
        _infoLabel.textAlignment = NSTextAlignmentCenter;
        _infoLabel.lineBreakMode=NSLineBreakByCharWrapping;
        
    }
    return _infoLabel;
}

- (void)onclickTrackInfoView {
    
}

- (void)hiddenInfoWindow {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            _infoWindow.alpha=0;
        } completion:^(BOOL finished) {
            _infoWindow.hidden = YES;
        }];
    });
}

- (NSString *)currentRectWithView : (UIView *)currentView {
    return [NSString stringWithFormat:@"ClassName:%@ x:%.1f y:%.1f width:%.1f height:%.1f",[currentView class],currentView.frame.origin.x,currentView.frame.origin.y,currentView.frame.size.width,currentView.frame.size.height];
}

- (UIView *)getFocusView : (UIView *)view point:(CGPoint)point {
    [self hitTest:view Point:point];
    UIView *viewTop=[hitArrayViews lastObject];//获取焦点后的视图
    [hitArrayViews removeAllObjects];
    return viewTop;
}

-(void)hitTest:(UIView*)view Point:(CGPoint) point;
{

    if ([view pointInside:point withEvent:nil] &&
        (!view.hidden) &&
        (view.alpha >= 0.01f) &&  ![view isDescendantOfView:self]) {
        [hitArrayViews removeAllObjects];
        [hitArrayViews addObject:view];
        for (UIView *subView in view.subviews) {
            CGPoint subPoint = CGPointMake(point.x - subView.frame.origin.x,
                                           point.y - subView.frame.origin.y);
            [self hitTest:subView Point:subPoint];
        }
    }
}
@end
