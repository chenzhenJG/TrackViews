
//  TrackViewModels.h
//  TrackiViews
//
//  Created by chenzhen on 2017/12/14.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface TrackGeneral : NSObject
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat update_x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat update_y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat update_width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat update_height;
@property (nonatomic, copy)   NSString *classname;
+ (TrackGeneral *)getGeneralWithView:(UIView *)view;
@end
@interface TrackViewModels : NSObject

@end
