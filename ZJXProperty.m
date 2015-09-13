//
//  ZJXProperty.m
//  FreeLimit
//
//  Created by 曾健新 on 15/3/14.
//  Copyright (c) 2015年 曾健新. All rights reserved.
// 



#import "ZJXProperty.h"

#define NSLog(Format,...) printf("%s\n",[[NSString stringWithFormat:Format,##__VA_ARGS__] UTF8String]);


@implementation ZJXProperty

#pragma mark - 传入字典输出属性
+(void)ZJXNSLogProperty:(NSDictionary*)dic
{
    NSArray *allKay = [dic allKeys];
    for (NSString *key in allKay) {
        id value = [dic valueForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            NSLog(@"@property(nonatomic,copy)NSString *%@;",key);
        }else if ([value isKindOfClass:[NSNumber class]])
        {
            NSLog(@"@property(nonatomic,copy)NSNumber *%@;",key);
        }else if ([value isKindOfClass:[NSArray class]])
        {
            NSLog(@"@property(nonatomic,copy)NSArray *%@;",key);
        }else if ([value isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"@property(nonatomic,copy)NSDictionary *%@;",key);
        }else
        {
             NSLog(@"@property(nonatomic,copy)??????? *%@;",key);
        }
        
    }
}

#pragma mark - 自动setValuesForKeysWithDictionary，前提是属性齐全
//注意部分属性和系统原本塑性有冲突，只能特殊处理
+(void)ZJXsetValuesForKeysWithDictionary:(id)object Dic:(NSDictionary*)dic
{
    NSArray *allKey = [dic allKeys];
    for (NSString *key in allKey) {
//         NSLog(@"成功赋值key:%@",key);
        [object setValue:[dic valueForKey:key] forKey:key];
    }
}



@end
