//
//  TrackInfoView.m
//  TrackiViews
//
//  Created by chenzhen on 2017/12/13.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//

#import "TrackInfoView.h"
#import "TrackInfoTableView.h"
#import "TrackInfoTableViewDataSource.h"
#import "TrackGeneralView.h"
@interface TrackInfoView() {
    NSArray *_titles;
}
@property (nonatomic,strong) UIScrollView *selectScrollView;
@property (nonatomic,strong) TrackInfoTableView *dataTableView;
@property (nonatomic,strong) TrackGeneralView *generalView;
@property (nonatomic,strong) TrackInfoTableViewDataSource *dataSource;
@end
@implementation TrackInfoView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _titles = @[@"General",@"SuperViews",@"SubViews"];
        _dataSource = [[TrackInfoTableViewDataSource alloc] init];
        [self addSubview:self.selectScrollView];
        [self addSubview:self.generalView];
        [self addSubview:self.dataTableView];
        
        
    }
    return self;
}

-  (void)setCurrentView:(UIView *)currentView {
    if (currentView) {
        _currentView = currentView;
        self.dataSource.currentView = currentView;
        self.dataSource.tableView = self.dataTableView;
        [self reloadData:GENERAL];//默认加载
    }
}

#pragma mark - getter and setter
- (UIScrollView *)selectScrollView {
    if (!_selectScrollView) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width / _titles.count;
        _selectScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 84)];
        for (int index = 0; index < _titles.count; index++) {
            UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
            selectButton.titleLabel.font = [UIFont systemFontOfSize:14];
            selectButton.tag = 1 << index;
            selectButton.frame = CGRectMake(index * width, 44, width, 40);
            [selectButton setTitle:_titles[index] forState:UIControlStateNormal];
            [_selectScrollView addSubview:selectButton];
            [selectButton addTarget:self action:@selector(didselectedButton:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return _selectScrollView;
}

- (TrackInfoTableView *)dataTableView {
    if (!_dataTableView) {
        _dataTableView = [[TrackInfoTableView alloc]initWithFrame:CGRectMake(0, _selectScrollView.frame.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - _selectScrollView.frame.size.height)];
        _dataTableView.alpha = self.alpha;
        _dataTableView.backgroundColor = self.backgroundColor;
        _dataTableView.dataSource = self.dataSource;
        _dataTableView.delegate = self.dataSource;
        _dataTableView.hidden = YES;
    }
    return _dataTableView;
}
- (TrackGeneralView *)generalView {
    if (!_generalView) {
        _generalView = [[TrackGeneralView alloc] initWithFrame:CGRectMake(0, _selectScrollView.frame.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - _selectScrollView.frame.size.height)];
        _generalView.alpha = self.alpha;
        _generalView.backgroundColor = self.backgroundColor;
    }
    return _generalView;
}

- (void)didselectedButton :(UIButton *)sender{
    NSInteger tag = sender.tag;
    [self reloadData:tag];
}

- (void)reloadData :(NSInteger)tag{
    if (tag != GENERAL) {
        self.dataTableView.hidden = NO;
        self.generalView.hidden = YES;
        [self.dataSource setLoadType:tag];
    }
    else {
        self.generalView.currentView = _currentView;
        self.dataTableView.hidden = YES;
        self.generalView.hidden = NO;
    }
}

- (void)dissmiss {
    self.alpha = 0;
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dissmiss];
}
@end
