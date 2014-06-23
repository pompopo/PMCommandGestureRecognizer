//
//  PMKakarotGestureRecognizer.m
//  CommandGestureRecognizer
//
//  Created by pom on 2014/06/23.
//  Copyright (c) 2014年 com.gmail.pompopo. All rights reserved.
//

#import "PMKakarotGestureRecognizer.h"

@implementation PMKakarotGestureRecognizer
- (id)initWithTarget:(id)target action:(SEL)action {
    return [super initWithTarget:target
                          action:action
                        commands:@[PMCommandUp,
                                   PMCommandX,
                                   PMCommandDown,
                                   PMCommandB,
                                   PMCommandL,
                                   PMCommandY,
                                   PMCommandR,
                                   PMCommandA]];
}
@end
