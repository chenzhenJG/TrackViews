//
//  TrackInfoTableViewCell.h
//  TrackiViews
//
//  Created by chenzhen on 2017/12/14.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrackInfoTableViewCell : UITableViewCell
+ (instancetype)cellWithTableView :(UITableView *)tableview;
@property (nonatomic,weak) UILabel *trackTitleLabel;
@property (nonatomic,weak) UILabel *trackSubTitleLabel;
@end
