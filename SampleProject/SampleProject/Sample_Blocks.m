//
//  Sample_Blocks.m
//  SampleProject
//
//  Created by 高浜 一道 on 2012/11/11.
//  Copyright (c) 2012年 高浜 一道. All rights reserved.
//

#import "Sample_Blocks.h"

@implementation Sample_Blocks

-(void)sample_001 {

    /*
        ブロックの定義の書き方----
        
            戻り値の型 (^ブロック名)(引数の型)

        ブロックの実装の書き方----
        
            ^(戻り値の型)(引数の型 引数名) {
            
            };

     */
    
    //例
    int (^Multiply)(int, int) = ^(int num1, int num2) {
        return num1 * num2;
    };
    int result = Multiply(7, 4); // result is 28

    
    
    NSDictionary *dic = @{
    @"name":@"Mario"
    ,@"age":@"33"
    ,@"method":^{NSLog(@"Hello world");}
    };
    NSLog(@"name: %@, age: %@", dic[@"name"], dic[@"age"]);
    void (^hello)(void) = dic[@"method"];
    hello();
    

}
@end
