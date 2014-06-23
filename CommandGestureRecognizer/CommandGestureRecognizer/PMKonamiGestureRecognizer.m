//
//  PMKonamiGestureRecognizer.m
//  CommandGestureRecognizer
//
//  Created by pom on 2014/06/23.
//  Copyright (c) 2014年 com.gmail.pompopo. All rights reserved.
//

#import "PMKonamiGestureRecognizer.h"

@implementation PMKonamiGestureRecognizer
- (id)initWithTarget:(id)target action:(SEL)action {
    return [super initWithTarget:target
                          action:action
                        commands:@[PMCommandUp,
                                   PMCommandUp,
                                   PMCommandDown,
                                   PMCommandDown,
                                   PMCommandLeft,
                                   PMCommandRight,
                                   PMCommandLeft,
                                   PMCommandRight,
                                   PMCommandB,
                                   PMCommandA]];
}
@end
