//
//  KeyboardFactory.m
//  工厂方法模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import "KeyboardFactory.h"
#import "KeyboardProduct.h"


@implementation KeyboardFactory

- (id)creatProduct {
    NSLog(@"生产键盘");
    return [[KeyboardProduct alloc] init];
}

@end
