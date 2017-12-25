//
//  TrackGeneralView.m
//  TrackiViews
//
//  Created by chenzhen on 2017/12/14.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//

#import "TrackGeneralView.h"
#import "TrackViewModels.h"
@interface TrackGeneralView() {
    CGFloat width;
    CGFloat margin;
    TrackGeneral *_general;
}
@property (nonatomic,strong) UILabel *classNameLabel;
@property (nonatomic,strong) UILabel *xLabel;
@property (nonatomic,strong) UILabel *yLabel;
@property (nonatomic,strong) UILabel *widthLabel;
@property (nonatomic,strong) UILabel *heightLabel;

@property (nonatomic,strong) UIButton *updateFrameButton;
@property (nonatomic,strong) UIButton *reductionFrameButton;


@end
@implementation TrackGeneralView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        margin = 24;
        width = [UIScreen mainScreen].bounds.size.width - margin * 2;
        [self addSubview:self.classNameLabel];
        [self addSubview:self.xLabel];
        [self addSubview:self.yLabel];
        [self addSubview:self.widthLabel];
        [self addSubview:self.heightLabel];
        [self addSubview:self.updateFrameButton];
        [self addSubview:self.reductionFrameButton];
       
    }
    return self;
}

- (void)setCurrentView:(UIView *)currentView {
    if (currentView) {
        _currentView = currentView;
        _general = [TrackGeneral getGeneralWithView:currentView];
        self.classNameLabel.text = [NSString stringWithFormat:@"ClassName: %@",_general.classname];
        self.xLabel.text         = [NSString stringWithFormat:@"X: %.1f",_general.x];
        self.yLabel.text         = [NSString stringWithFormat:@"Y: %.1f",_general.y];
        self.widthLabel.text     = [NSString stringWithFormat:@"WIDTH: %.1f",_general.width];
        self.heightLabel.text    = [NSString stringWithFormat:@"HEIGHT: %.1f",_general.height];
    }
}

- (UILabel *)classNameLabel {
    if (!_classNameLabel) {
        _classNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 24, width, 40)];
        _classNameLabel.textColor = [UIColor whiteColor];
        _classNameLabel.font = [UIFont systemFontOfSize:14];
        _classNameLabel.numberOfLines = 2;
    }
    return _classNameLabel;
}

- (UILabel *)xLabel {
    if (!_xLabel) {
        _xLabel = [[UILabel alloc]initWithFrame:CGRectMake(24, _classNameLabel.frame.origin.y+_classNameLabel.frame.size.height, width, 40)];
        _xLabel.textColor = [UIColor whiteColor];
        _xLabel.font = [UIFont systemFontOfSize:14];
        
    }
    return _xLabel;
}

- (UILabel *)yLabel {
    if (!_yLabel) {
        _yLabel = [[UILabel alloc]initWithFrame:CGRectMake(24, _xLabel.frame.origin.y+_xLabel.frame.size.height, width, 40)];
        _yLabel.textColor = [UIColor whiteColor];
        _yLabel.font = [UIFont systemFontOfSize:14];
    }
    return _yLabel;
}
- (UILabel *)widthLabel {
    if (!_widthLabel) {
        _widthLabel = [[UILabel alloc]initWithFrame:CGRectMake(24, _yLabel.frame.origin.y+_yLabel.frame.size.height, width, 40)];
        _widthLabel.textColor = [UIColor whiteColor];
        _widthLabel.font = [UIFont systemFontOfSize:14];
    }
    return _widthLabel;
}

- (UILabel *)heightLabel {
    if (!_heightLabel) {
        _heightLabel = [[UILabel alloc]initWithFrame:CGRectMake(24, _widthLabel.frame.origin.y+_widthLabel.frame.size.height, width, 40)];
        _heightLabel.textColor = [UIColor whiteColor];
        _heightLabel.font = [UIFont systemFontOfSize:14];
    }
    return _heightLabel;
}

- (UIButton *)updateFrameButton {
    if (!_updateFrameButton) {
        _updateFrameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_updateFrameButton setFrame:CGRectMake(width, _heightLabel.frame.origin.y+_heightLabel.frame.size.height, 40, 40)];
        _updateFrameButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _updateFrameButton.layer.borderWidth = .5;
        [_updateFrameButton setTitle:@"修改" forState:UIControlStateNormal];
        _updateFrameButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_updateFrameButton addTarget:self action:@selector(update:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _updateFrameButton;
}
- (UIButton *)reductionFrameButton {
    if (!_reductionFrameButton) {
        _reductionFrameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reductionFrameButton setFrame:CGRectMake(width - 60, _heightLabel.frame.origin.y+_heightLabel.frame.size.height, 40, 40)];
        _reductionFrameButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _reductionFrameButton.layer.borderWidth = .5;
        [_reductionFrameButton setTitle:@"还原" forState:UIControlStateNormal];
        _reductionFrameButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_reductionFrameButton addTarget:self action:@selector(reduction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _reductionFrameButton;
}

- (void)update:(UIButton *)sender {
    [_general setUpdate_x:100];
    [_general setUpdate_y:100];
    [_general setUpdate_width:100];
    [_general setUpdate_height:100];
    self.xLabel.text         = [NSString stringWithFormat:@"X: %.1f",_general.update_x];
    self.yLabel.text         = [NSString stringWithFormat:@"Y: %.1f",_general.update_y];
    self.widthLabel.text     = [NSString stringWithFormat:@"WIDTH: %.1f",_general.update_width];
    self.heightLabel.text    = [NSString stringWithFormat:@"HEIGHT: %.1f",_general.update_height];
    self.currentView.frame = CGRectMake(_general.update_x, _general.update_y, _general.update_width, _general.update_height);
}
- (void)reduction:(UIButton *)sender {
    self.xLabel.text         = [NSString stringWithFormat:@"X: %.1f",_general.x];
    self.yLabel.text         = [NSString stringWithFormat:@"Y: %.1f",_general.y];
    self.widthLabel.text     = [NSString stringWithFormat:@"WIDTH: %.1f",_general.width];
    self.heightLabel.text    = [NSString stringWithFormat:@"HEIGHT: %.1f",_general.height];
    self.currentView.frame = CGRectMake(_general.x, _general.y, _general.width, _general.height);
}
@end
