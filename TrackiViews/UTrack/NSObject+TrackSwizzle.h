//
//  NSObject+TrackSwizzle.h
//  TrackiViews
//
//  Created by chenzhen on 2017/12/13.
//  Copyright © 2017年 站在巨人肩膀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TrackSwizzle)
+(void)swizzleMethod:(Class)cls originSelector:(SEL)originSelector swizzledSelector:(SEL)swizzledSelector;

@end
