//
//  Sample_Calendar.m
//  SampleProject
//
//  Created by 高浜 一道 on 2013/04/20.
//  Copyright (c) 2013年 高浜 一道. All rights reserved.
//

#import "Sample_Calendar.h"

@implementation Sample_Calendar

//その月の日数を取得
- (NSNumber*)getMonthDaysCount:(NSDate*)date
{
    NSNumber *daysCount = nil;
    
    NSDate *today = [NSDate date];
    NSCalendar *c = [NSCalendar currentCalendar];
    NSRange days = [c rangeOfUnit:NSDayCalendarUnit
                           inUnit:NSMonthCalendarUnit
                          forDate:today];
    daysCount = [NSNumber numberWithInt:days.length];
    return daysCount;
}


@end
