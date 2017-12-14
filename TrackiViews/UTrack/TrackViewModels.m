
//  TrackViewModels.m
//  TrackiViews
//
//  Created by chenzhen on 2017/12/14.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//
#import "TrackViewModels.h"
@implementation TrackGeneral
+ (TrackGeneral *)getGeneralWithView:(UIView *)view {
    TrackGeneral *model = [[TrackGeneral alloc] init];
    model.classname = [NSString stringWithFormat:@"%@，<%p>",NSStringFromClass([view class]),view];
    model.x = view.frame.origin.x;
    model.y = view.frame.origin.y;
    model.width = view.frame.size.width;
    model.height = view.frame.size.height;
    return model;
}
@end
@implementation TrackViewModels

@end
