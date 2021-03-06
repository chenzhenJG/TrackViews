
//  TrackInfoTableViewDataSource.m
//  TrackiViews
//
//  Created by chenzhen on 2017/12/14.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//
#import "TrackInfoTableViewDataSource.h"
#import "TrackInfoTableView.h"
#import "TrackInfoTableViewCell.h"
#import "TrackViewModels.h"
@interface TrackInfoTableViewDataSource()
@property (nonatomic, strong) NSMutableArray *superdataSourceArray;
@property (nonatomic, strong) NSMutableArray *subdataSourceArray;
@end
@implementation TrackInfoTableViewDataSource
- (instancetype)init {
    if (self = [super init]) {
        _superdataSourceArray = [NSMutableArray array];
        _subdataSourceArray = [NSMutableArray array];
    }
    return self;
}

- (void)setLoadType:(LoadType)loadType {
    _loadType = loadType;
    [_superdataSourceArray removeAllObjects];
    [_subdataSourceArray removeAllObjects];
    if (loadType == SUPERVIEWS) {
        UIView *viewSupper=_currentView;
        while ((viewSupper=viewSupper.superview)) {
            TrackViewModels *model = [[TrackViewModels alloc] init];
            model.title = NSStringFromClass([viewSupper class]);
            model.subTitle = [NSString stringWithFormat:@"x:%0.1lf y:%0.1lf width:%0.1lf height:%0.1lf",viewSupper.frame.origin.x,viewSupper.frame.origin.y,viewSupper.frame.size.width,viewSupper.frame.size.height];
            [_superdataSourceArray addObject:model];
            
        }
    }
    else if (loadType == SUBVIEWS) {
        UIView *view =_currentView;
        for (UIView *subView in view.subviews) {
            TrackViewModels *model = [[TrackViewModels alloc] init];
            model.title = NSStringFromClass([subView class]);
            model.subTitle = [NSString stringWithFormat:@"x:%0.1lf y:%0.1lf width:%0.1lf height:%0.1lf",subView.frame.origin.x,subView.frame.origin.y,subView.frame.size.width,subView.frame.size.height];
            [_subdataSourceArray addObject:model];
        }
    }
    [self.tableView reloadData];
}
#pragma mark - tableview delegate datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_loadType == SUPERVIEWS) {
        return self.superdataSourceArray.count;
    }
    else if (_loadType == SUBVIEWS) {
        return self.subdataSourceArray.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TrackInfoTableViewCell *cell = [TrackInfoTableViewCell cellWithTableView:tableView];
    
    if (_loadType == SUPERVIEWS) {
        TrackViewModels *model = [self.superdataSourceArray objectAtIndex:indexPath.row];
        cell.trackTitleLabel.text = model.title;
        cell.trackSubTitleLabel.text = model.subTitle;
        
    }
    else if (_loadType == SUBVIEWS) {
        TrackViewModels *model = [self.subdataSourceArray objectAtIndex:indexPath.row];
        cell.trackTitleLabel.text = model.title;
        cell.trackSubTitleLabel.text = model.subTitle;
    }
    return cell;
}


@end
