//
//  PMCapcomGestureRecognizer.m
//  CommandGestureRecognizer
//
//  Created by pom on 2014/06/23.
//  Copyright (c) 2014年 com.gmail.pompopo. All rights reserved.
//

#import "PMCapcomGestureRecognizer.h"

@implementation PMCapcomGestureRecognizer

- (id)initWithTarget:(id)target action:(SEL)action {
    return [super initWithTarget:target
                          action:action
                        commands:@[PMCommandDown,
                                   PMCommandR,
                                   PMCommandUp,
                                   PMCommandL,
                                   PMCommandY,
                                   PMCommandB,
                                   PMCommandX,
                                   PMCommandA]];
}
@end
