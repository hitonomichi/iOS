//
//  Sample_FileOperation.m
//  SampleProject
//
//  Created by 高浜 一道 on 2013/02/02.
//  Copyright (c) 2013年 高浜 一道. All rights reserved.
//

#import "Sample_FileOperation.h"

@implementation Sample_FileOperation

//NSDictionary型のplistを返す
- (NSDictionary*) getPlistDic:(NSString*)plistName
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

@end
