//
//  ViewController.m
//  RevanTimer
//
//  Created by 紫荆秋雪 on 2018/7/26.
//  Copyright © 2018年 紫荆秋雪. All rights reserved.
//

#import "ViewController.h"
#import "RevanTimer.h"

@interface ViewController ()
@property (nonatomic, copy) NSString *name;
@end

@implementation ViewController

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    __weak typeof(self) weakSelf = self;
    self.name = [RevanTimer revan_timerWithTimeStart:0 interval:1 repeats:YES async:NO block:^{
        [weakSelf timerFire];
    }];

    
}

- (void)timerTargetTest {
    self.name = [RevanTimer revan_timerWithTimeStart:0 interval:1 target:self selector:@selector(timerFire) repeats:YES async:YES];
}

- (void)timerFire {
    NSLog(@"%s -- %@", __func__, [NSThread currentThread]);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [RevanTimer revan_invalidateWithIdentity:self.name];
}

@end
