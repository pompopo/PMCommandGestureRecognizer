//
//  PMCommandGestureRecognizer.h
//  CommandGestureRecognizer
//
//  Created by pom on 2014/06/23.
//  Copyright (c) 2014年 com.gmail.pompopo. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *const PMCommandUp = @"UP";
static NSString *const PMCommandDown = @"DOWN";
static NSString *const PMCommandRight = @"RIGHT";
static NSString *const PMCommandLeft = @"LEFT";
static NSString *const PMCommandA = @"A";
static NSString *const PMCommandB = @"B";
static NSString *const PMCommandX = @"X";
static NSString *const PMCommandY = @"Y";
static NSString *const PMCommandL = @"L";
static NSString *const PMCommandR = @"R";

@interface PMCommandGestureRecognizer : UIGestureRecognizer
- (id)initWithTarget:(id)target action:(SEL)action commands:(NSArray *)commands;
@end
