//
//  Sample_NSAttributedString.m
//  SampleProject
//
//  Created by 高浜　一道 on 2014/02/22.
//  Copyright (c) 2014年 高浜 一道. All rights reserved.
//

#import "Sample_NSAttributedString.h"

@implementation Sample_NSAttributedString

- (void) create {
    NSDictionary *stringAttributes1 = @{ NSForegroundColorAttributeName : [UIColor greenColor],
                                         NSFontAttributeName : [UIFont systemFontOfSize:18.0f] };
    NSAttributedString *string1 = [[NSAttributedString alloc] initWithString:@"ちんぺい"
                                                                  attributes:stringAttributes1];
    
    NSDictionary *stringAttributes2 = @{ NSForegroundColorAttributeName : [UIColor blackColor],
                                         NSFontAttributeName : [UIFont boldSystemFontOfSize:14.0f] };
    NSAttributedString *string2 = [[NSAttributedString alloc] initWithString:@"＆"
                                                                  attributes:stringAttributes2];
    
    NSDictionary *stringAttributes3 = @{ NSForegroundColorAttributeName : [UIColor redColor],
                                         NSFontAttributeName : [UIFont systemFontOfSize:18.0f] };
    NSAttributedString *string3 = [[NSAttributedString alloc] initWithString:@"みっちー"
                                                                  attributes:stringAttributes3];
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] init];
    [mutableAttributedString appendAttributedString:string1];
    [mutableAttributedString appendAttributedString:string2];
    [mutableAttributedString appendAttributedString:string3];
    
    UILabel *lbl = [[UILabel alloc]init];
    lbl.attributedText = mutableAttributedString;

}

@end
