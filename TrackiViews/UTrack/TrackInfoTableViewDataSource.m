
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
@end
@implementation TrackInfoTableViewDataSource
- (instancetype)init {
    if (self = [super init]) {
        _superdataSourceArray = [NSMutableArray array];
    }
    return self;
}

- (void)setLoadType:(LoadType)loadType {
    _loadType = loadType;
    [_superdataSourceArray removeAllObjects];
    if (loadType == SUPERVIEWS) {
        UIView *viewSupper=_currentView;
        while ((viewSupper=viewSupper.superview)) {
            TrackViewModels *model = [[TrackViewModels alloc] init];
            model.title = NSStringFromClass([viewSupper class]);
            model.subTitle = [NSString stringWithFormat:@"x:%0.1lf y:%0.1lf width:%0.1lf height:%0.1lf",viewSupper.frame.origin.x,viewSupper.frame.origin.y,viewSupper.frame.size.width,viewSupper.frame.size.height];
            [_superdataSourceArray addObject:model];
            
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
    return cell;
}


@end
