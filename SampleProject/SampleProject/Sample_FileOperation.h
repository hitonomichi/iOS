//
//  Sample_FileOperation.h
//  SampleProject
//
//  Created by 高浜 一道 on 2013/02/02.
//  Copyright (c) 2013年 高浜 一道. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sample_FileOperation : NSObject

//NSDictionary型のplistを返す
- (NSDictionary*) getPlistDic:(NSString*)plistName;
//NSArray型のplistを返す
- (NSArray*) getPlistArray:(NSString*)plistName;

@end
