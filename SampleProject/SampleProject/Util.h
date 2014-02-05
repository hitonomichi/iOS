//
//  Util.h
//
//  Created by 高浜 一道 on 2013/01/27.
//  Copyright (c) 2013年 高浜 一道. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

//NSDictionary型のplistを返す
+ (NSDictionary*) getPlistDic:(NSString*)plistName;
//NSArray型のplistを返す
- (NSArray*) getPlistArray:(NSString*)plistName;
//stringがnilまたは＠””の場合YES
+ (BOOL)isEmptyString:(NSString*)string;
//日付から指定フォーマットで文字列を返却
+ (NSString*) stringFromDate:(NSDate*)date withFormat:(NSString*)format;
//文字列から指定フォーマットで日付を返却
+ (NSDate*) dateFromString:(NSString*)string withFormat:(NSString*)format;
@end
