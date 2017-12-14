
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

@end
@implementation TrackInfoTableViewDataSource
- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)setLoadType:(LoadType)loadType {
    _loadType = loadType;
    [self.tableView reloadData];
}
#pragma mark - tableview delegate datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TrackInfoTableViewCell *cell = [TrackInfoTableViewCell cellWithTableView:tableView];
    
    return cell;
}


@end
