//
//  Sample_NSString.m
//  SampleProject
//
//  Created by 高浜 一道 on 2012/11/11.
//  Copyright (c) 2012年 高浜 一道. All rights reserved.
//

#import "Sample_NSString.h"

@implementation Sample_NSString

- (void) sample001 {
    //--------------------------
    //ファイルパス関係
    //--------------------------
    /*
    ディレクトリを取得する。
    NSSearchPathForDirectoriesInDomains

    パス追加。「/」自動挿入。
    stringByAppendingPathComponent

    拡張子追加。
    stringByAppendingPathExtension
    
    */
    
    //「Documents」ディレクトリを取得 他のディレクトリは下記リンク参照。
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    // hogehogeディレクトリorファイルのパス追加
    path = [path stringByAppendingPathComponent:@"hogehoge"];
    // 拡張子追加
    path = [path stringByAppendingPathExtension:@"pdf"];
    
    
}


@end
