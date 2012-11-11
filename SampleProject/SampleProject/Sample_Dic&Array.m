//
//  Sample_Dic&Array.m
//  SampleProject
//
//  Created by 高浜 一道 on 2012/11/11.
//  Copyright (c) 2012年 高浜 一道. All rights reserved.
//

#import "Sample_Dic&Array.h"

@implementation Sample_Dic_Array

-(void)sample_001
{

    //NSDictionary 短縮定義-----
    NSDictionary *dic = @{
    @"name":@"Mario"
    ,@"age":@"33"
    ,@"method":^{NSLog(@"Hello world");}
    };
 
    NSLog(@"name: %@, age: %@", dic[@"name"], dic[@"age"]);
    void (^hello)(void) = dic[@"method"];
    hello();
    
    //NSArray 短縮定義--------
    NSArray *arr = @[
    @"Peach"
    , @"27"
    , ^(int a, int b){
        return a + b;
      }
    ];
    
    NSLog(@"name: %@, age: %@", arr[0], arr[1]);
    int (^add)(int,int) = arr[2];
    NSLog(@"5 + 3 = %d",add(5,3));
    
    //ちなみに他の定義の仕方-------
    NSNumber *fortyTwo = @42;           //これを書くのと同じ[NSNumber numberWithInt:42]
    NSNumber *piFloat = @3.141592654F;  //これと同じ [NSNumber numberWithFloat:3.141592654F]
    NSNumber *yesNumber = @YES;         //これと同じ [NSNumber numberWithBool:YES]
    
}
@end
