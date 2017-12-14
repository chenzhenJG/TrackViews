//
//  TrackInfoView.m
//  TrackiViews
//
//  Created by chenzhen on 2017/12/13.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//

#import "TrackInfoView.h"

@implementation TrackInfoView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}



- (void)dissmiss {
    [UIView animateWithDuration:.3 animations:^{
        self.frame = CGRectMake(0, -300, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}
@end
