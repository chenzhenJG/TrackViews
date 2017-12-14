//
//  UIWindow+TrackLoad.m
//  TrackiViews
//
//  Created by chenzhen on 2017/12/13.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//

#import "UIWindow+TrackLoad.h"
#import "NSObject+TrackSwizzle.h"
#import "TrackView.h"
@implementation UIWindow (TrackLoad)
+ (void)load {
    [self swizzleMethod:self originSelector:@selector(makeKeyAndVisible) swizzledSelector:@selector(__makeKeyAndVisible)];
}

- (void)__makeKeyAndVisible {
    [self __makeKeyAndVisible];
    TrackView *_trackView = [[TrackView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-35, 100, 30, 30)];
    [self addSubview:_trackView];
}
@end
