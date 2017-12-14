
//  TrackInfoTableViewDataSource.h
//  TrackiViews
//
//  Created by chenzhen on 2017/12/14.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//
#import <UIKit/UIKit.h>
@class TrackInfoTableView;
typedef enum : NSUInteger {
    GENERAL     = 1 << 0,
    SUPERVIEWS  = 1 << 1,
    SUBVIEWS    = 1 << 3,
} LoadType;
@interface TrackInfoTableViewDataSource : NSObject <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) TrackInfoTableView *tableView;
@property (nonatomic,strong) UIView *currentView;
@property (nonatomic,assign) LoadType loadType;
@end
