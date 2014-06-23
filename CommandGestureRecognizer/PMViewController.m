//
//  PMViewController.m
//  CommandGestureRecognizer
//
//  Created by pom on 2014/06/23.
//  Copyright (c) 2014年 com.gmail.pompopo. All rights reserved.
//

#import "PMViewController.h"
#import "PMKonamiGestureRecognizer.h"
#import "PMKakarotGestureRecognizer.h"
@interface PMViewController ()

@end

@implementation PMViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PMKonamiGestureRecognizer *recognizer = [[PMKonamiGestureRecognizer alloc] initWithTarget:self action:@selector(powerup:)];
    [self.view addGestureRecognizer:recognizer];
    
    PMKakarotGestureRecognizer *recognizer2 = [[PMKakarotGestureRecognizer alloc] initWithTarget:self action:@selector(kakarot:)];
    [self.view addGestureRecognizer:recognizer2];
}

- (void)powerup:(UIGestureRecognizer *)recognizer {
    NSLog(@"full power");
}
- (void)kakarot:(UIGestureRecognizer *)recognizer {
    NSLog(@"kakarot");
}
@end
