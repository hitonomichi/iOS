//
//  Sample_dispach.m
//  SampleProject
//
//  Created by 高浜 一道 on 2013/02/02.
//  Copyright (c) 2013年 高浜 一道. All rights reserved.
//

#import "Sample_dispach.h"

@implementation Sample_dispach
static Sample_dispach* sample_dispach = nil;

//シングルトンの生成
+ (Sample_dispach*)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sample_dispach = [[Sample_dispach alloc] init];
    });
    return sample_dispach;
}

@end
