//
//  Util.m
//
//  Created by 高浜 一道 on 2013/01/27.
//  Copyright (c) 2013年 高浜 一道. All rights reserved.
//

#import "Util.h"

@implementation Util

//NSDictionary型のplistを返す
+ (NSDictionary*) getPlistDic:(NSString*)plistName
{
    NSString* path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary* plist = [NSDictionary dictionaryWithContentsOfFile:path];
    return plist;
}
//NSArray型のplistを返す
- (NSArray*) getPlistArray:(NSString*)plistName
{
    NSString* path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSArray* plist = [NSDictionary dictionaryWithContentsOfFile:path];
    return plist;
}
+ (BOOL)isEmptyString:(NSString*)string
{
    if (!string) return YES;
    if ([string isEqualToString:@""]) return YES;
    return NO;
}
+ (NSDateFormatter*)formatter:(NSString*)format
{
    if ([Util isEmptyString:format]) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:format];
    [dateFormatter setLocale:[NSLocale systemLocale]];
    return dateFormatter;
}
+ (NSString*)stringFromDate:(NSDate*)date withFormat:(NSString*)format
{
    if (!date || [Util isEmptyString:format]) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [Util formatter:format];
    return [dateFormatter stringFromDate:date];
}
+ (NSDate*)dateFromString:(NSString*)string withFormat:(NSString*)format
{
    if ([Util isEmptyString:string] || [Util isEmptyString:format]) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [Util formatter:format];
    return [dateFormatter dateFromString:string];
}



@end
