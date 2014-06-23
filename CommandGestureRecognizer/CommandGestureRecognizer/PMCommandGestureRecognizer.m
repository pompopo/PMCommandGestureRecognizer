//
//  PMCommandGestureRecognizer.m
//  CommandGestureRecognizer
//
//  Created by pom on 2014/06/23.
//  Copyright (c) 2014年 com.gmail.pompopo. All rights reserved.
//

#import "PMCommandGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface PMCommandGestureRecognizer ()
@property (nonatomic, strong) NSArray *commands;
@property (nonatomic) NSInteger currentStep;
@property (nonatomic) CGPoint point;
@end

@implementation PMCommandGestureRecognizer

- (id)initWithTarget:(id)target action:(SEL)action commands:(NSArray *)commands {
    self = [super initWithTarget:target action:action];
    if (self != nil) {
        _commands = commands.copy;
    }
    return self;
}

- (NSString *)directionFromPoint:(CGPoint)from toPoint:(CGPoint)to {
    CGFloat xd = to.x - from.x;
    if (xd == 0) {
        xd = 1.0f;
    }
    CGFloat yd = -(to.y - from.y);
    CGFloat radian = atan2f(yd, xd);
    if (radian < 0) {
        radian += 2 * M_PI;
    }
    const CGFloat diff = M_PI / 18;

    if (radian < diff || 2 * M_PI - radian < diff) {
        return PMCommandRight;
    } else if (ABS(radian - M_PI * 0.5) < diff) {
        return PMCommandUp;
    } else if (ABS(radian - M_PI) < diff) {
        return PMCommandLeft;
    } else if (ABS(radian - M_PI * 1.5) < diff) {
        return PMCommandDown;
    } else {
        return nil;
    }
}

- (BOOL)shouldCheckSwipeCommand {
    NSString *command = self.commands[self.currentStep];
    return [command isEqualToString:PMCommandRight]
            || [command isEqualToString:PMCommandUp]
            || [command isEqualToString:PMCommandLeft]
            || [command isEqualToString:PMCommandDown];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    self.point = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    if (![self shouldCheckSwipeCommand]) {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    [super touchesEnded:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    NSString *command = self.commands[self.currentStep];
    if ([self shouldCheckSwipeCommand]) {
        NSString *direction = [self directionFromPoint:self.point toPoint:point];
        if (![direction isEqualToString:command]) {
            self.state = UIGestureRecognizerStateFailed;
        }
    } else if ([command isEqualToString:PMCommandA]) {
        if (point.x < self.view.frame.size.width / 2) {
            self.state = UIGestureRecognizerStateFailed;
        }
    } else if ([command isEqualToString:PMCommandB]) {
        if (point.y < self.view.frame.size.height / 2) {
            self.state = UIGestureRecognizerStateFailed;
        }
    } else if ([command isEqualToString:PMCommandY]) {
        if (point.x > self.view.frame.size.width / 2) {
            self.state = UIGestureRecognizerStateFailed;
        }
    } else if ([command isEqualToString:PMCommandX]) {
        if (point.y > self.view.frame.size.height / 2) {
            self.state = UIGestureRecognizerStateFailed;
        }
    } else if ([command isEqualToString:PMCommandL]) {
        if (point.y > self.view.frame.size.height / 2 || point.x > self.view.frame.size.width / 2) {
            self.state = UIGestureRecognizerStateFailed;
        }
    } else if ([command isEqualToString:PMCommandR]) {
        if (point.y > self.view.frame.size.height / 2 || point.x < self.view.frame.size.width / 2) {
            self.state = UIGestureRecognizerStateFailed;
        }
    }

    if (self.state != UIGestureRecognizerStateCancelled) {
        self.currentStep++;
        if (self.currentStep == self.commands.count) {
            self.state = UIGestureRecognizerStateRecognized;
        }
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateFailed;
}

- (void)reset {
    [super reset];
    self.currentStep = 0;
}
@end
