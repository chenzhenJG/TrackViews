//
//  TrackInfoTableViewCell.m
//  TrackiViews
//
//  Created by chenzhen on 2017/12/14.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//

#import "TrackInfoTableViewCell.h"

@implementation TrackInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //custom
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        UILabel *trackTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, 12, width - 24, 24)];
        trackTitleLabel.font = [UIFont systemFontOfSize:15];
        trackTitleLabel.textColor = [UIColor redColor];
        _trackTitleLabel = trackTitleLabel;
        UILabel *trackSubTitleLabelLabel = [[UILabel alloc]initWithFrame:CGRectMake(14, 40, width - 24, 24)];
        trackSubTitleLabelLabel.font = [UIFont systemFontOfSize:13];
        trackSubTitleLabelLabel.textColor = [UIColor redColor];
        _trackSubTitleLabel = trackSubTitleLabelLabel;
        [self.contentView addSubview:self.trackTitleLabel];
        [self.contentView addSubview:self.trackSubTitleLabel];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableview {
    static NSString *key = @"TrackInfoTableViewCell";
    TrackInfoTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:key];
    if (!cell) {
        cell = [[TrackInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:key];
        cell.backgroundColor = tableview.backgroundColor;
        cell.alpha = tableview.alpha;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}



@end
